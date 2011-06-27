#include <string>
#include <fstream>
#include <streambuf>
#include "constants.h"
#include <iostream>
#include <vector>
#include "PDS.h"
#include <math.h>
#include <sstream>

using namespace std;

// Paul Vines
// 6/23/2011

// This program finds all the limit cycles in an input PDS.
// The input should be in the same format as ADAM inputs
// Theoretical Limit of 3^11 states if limit cycle is the max size

vector<PDS> pds; // vector of polynomial equations for each variable
int state; // the current state
unsigned char * checkedArray;
int num_states; // number of possibilities for states [0,1,2]
int num_vars; // number of variables in the total system
ofstream * fileOut; // output file pointer


// NOT USED IN CURRENT VERSION
// PRE: 
// POST: the PDSs and checkedArray are reset to empty/0's
void reset(){
  pds.clear();

  int num_states = ceil(pow(num_states,num_vars) / BYTE_SIZE);
  checkedArray = new unsigned char[num_states];
  for (int i = 0; i < num_states; i++){
    checkedArray[i] = 0;
  }    

}


// PRE: Input is a valid string which may contain spaces or tabs
// POST: Input is returned with all spaces and tabs removed
string removeSpaces(string input){
  string output = input;
      for (int i = 0; i < output.length(); i++){
	if (output[i] == ' ' || output[i] == '\t'){
	  output.erase(i,1);
	  i--;
	}
      }
      return output;
}

// PRE: input contains all the file contents
// POST: pds's have been constructed for each polynomial in the input
// string
void parseInput(string input){
   vector<int> breakPoints;
   PDS * temp;

   // Generate break points for each 'f'
  for (int i = 0; i < input.length(); i++){
    if (input[i] == 'f'){
      breakPoints.push_back(i);
    }
  }

  // Split input at breakpoints and construct PDSs
  for (int i = 0; i < breakPoints.size(); i++){
    if (i < breakPoints.size() - 1){
      string function = removeSpaces(input.substr(breakPoints[i], breakPoints[i+1] - breakPoints[i]));
      temp = new PDS(function, num_states);
    }
    else{
      string function = removeSpaces(input.substr(breakPoints[i], input.length()));
      temp = new PDS(function, num_states);
    }
    pds.push_back(*temp);
  }

}

// PRE: filename contains the name of a valid input file
// POST: the number of variables in the input is returned, the input
// file has been extracted to a string and passed to parseInput and
// the PDSs constructed
short readInput(string filename){

  ifstream inputStream(filename.c_str());
  string input = "";

  if (inputStream.is_open()){
    
    char temp;
    
    while(inputStream){
      inputStream >> temp;
      input += temp;
    }
    input[input.length() -1] = '\0';
    parseInput(input);
   }
  else{
    cout << "Input File Not Found" << endl;
  }
  return pds.size(); 
}


// PRE: PDSs are defined
// POST: The PDSs are output in the same format as input for
// comparison purposes
void printPDS(){
  
  stringstream output;

  for (int a = 0; a < pds.size(); a++){
    output << "f" << (int)(a+1) << "=";

    for (int b = 0; b < pds[a].coefs.size(); b++){      

      if (pds[a].coefs[b] != -1 || pds[a].pows[b][0] == 0){
	output << (int)pds[a].coefs[b];
      }
      if (pds[a].pows[b][0] != 0){
	for (int c = 0; c < pds[a].vars[b].size(); c++){
	  if (pds[a].coefs[b] == -1 && c == 0){
	    output << "x" << (int)pds[a].vars[b][c] + 1;
	  }
	  else{
	    output << "*x" << (int)pds[a].vars[b][c] + 1;
	  }
	  if (pds[a].pows[b][c] != 1){
	    output << "^" << (int)pds[a].pows[b][c];
	  }
	}
      }
      if (b < pds[a].coefs.size() - 1){
	output << '+';
      }
    }
    output << "\n";
  }
  cout << output.str() << endl;
}


// PRE: n is the decimal to convert, v is a unsigned char array for
//the conversion, j is the base to convert to
// POST: v contains the base-j form of n, in ascending order of power
// ASSUMPTIONS: v is long enough to fit n in base-j AND v is clean
void decimalToTernary(int n, unsigned char * v, int j)
{
  int a=0,b=n,i=0;
  while (b != 0)
    {
      a = b%j;
      v[i] = a;
      b = b/j;
      i++;
    }
}

// PRE: v is an array of numbers for a number in base-j, j is the base
// of the number
// POST: the decimal value of this is returned
int ternaryToDecimal(unsigned char v[], int j){
  int result = 0;
  for (int i = 0; i < num_vars; i++){
    result += (int)(v[i] * pow(j, i));
  }
  return result;
}

// PRE: state is defined as a valid state, checkedArray is of
// sufficient size to contain the state number of bits
// POST: the value of the bit specified is returned, a 1 indicates it
// has been visited before, a 0 indicates it has not been visited
// before
bool wasChecked(int state){
  int index = state / BYTE_SIZE;
  int bit = state % BYTE_SIZE;

  return (checkedArray[index]>>bit)&1;
}

// PRE: state is defined, checkedArray contains state-amount of bits
// POST: the entry corresponding to state in checkedArray is now a 1
void setChecked(int state){
  if (!wasChecked(state)){ 
    unsigned char newValue = 1;
    unsigned char bit = state % BYTE_SIZE;
    for (unsigned char i = 0; i < bit; i++){
      newValue = newValue<<1; 
      newValue = newValue&CLEAR_1ST_BIT_MASK;
    }
    
    
    checkedArray[state / BYTE_SIZE] = checkedArray[state / BYTE_SIZE]|newValue;
      }
}

// PRE: curState is an integer <= num_states^num_vars - 1
// POST: the next state, according to the PDS, is returned
int nextState(int curState){
  unsigned char * temp = new unsigned char[num_vars];
  unsigned char * temp2 = new unsigned char[num_vars];
  for (int i = 0; i < num_vars; i++){
    temp[i] = 0;
    temp2[i] = 0;
  }
  decimalToTernary(curState, temp, num_states);
  for (unsigned char i = 0; i < num_vars; i++){
    temp2[i] = pds[i].evaluate(temp);
  }
 
  return ternaryToDecimal(temp2, num_states);
}

// PRE: state is defined, path is defined as a vector of at least 1
// state
// POST: the location of state in the vector path is returned if it
// exists, otherwise -1 is returned
int cycle(int state, vector<int>& path){
  int cycle = -1;
  for (int i = 0; i < path.size(); i++){
    if (state == path[i]){
      cycle = i;
    }
  }
  return cycle;
}

// PRE: cycleStart is an integer representing the first state in the
// limit cycle, path is a vector containing the cycle
// POST: each state in the limit cycle is output
void outputCycle(int cycleStart, vector<int>& path){

  stringstream output;
  output << "CYCLE FOUND:\n LENGTH: ";
  output << (path.size() - cycleStart);
  output << "\n";

  unsigned char * temp = new unsigned char[num_vars];
  
  for (int i = cycleStart; i < path.size(); i++){
    for (int k = 0; k < num_vars; k++){
      temp[k] = 0;
    }

    decimalToTernary(path[i], temp, num_states);
    output << "[ ";
    for (int k = 0; k < num_vars; k++){
      output << (short)temp[k];
      output <<" ";
    }
    output << "]\n";
  }

  *fileOut << output.str() << endl;
  cout << output.str() << endl;
}

// PRE: curState is a valid state in state space
// POST: curState is output in its array form
void printState(int curState){

  unsigned char * temp = new unsigned char[num_vars]();
  for (int i = 0; i < num_vars; i++){
    temp[i] = 0;
  }

  cout << "CUR: " << curState << endl;
  decimalToTernary(curState, temp, num_states);

    cout << "[";
    for (int i = 0; i < num_vars; i++){
      cout << " " << (int)temp[i];
    }
  cout << " ]" << endl;

}

// PRE: PDS is defined
// POST: all limit cycles have been found and output
void run(){
  vector<int> * path = new vector<int>();
  state = 0;
  int maxState = pow(num_states, num_vars);
  
  cout << "State Space Size: " << maxState << endl;
  path = new vector<int>();
  for (int iterState = 0; iterState < maxState; iterState++){
    path->clear();

    state = iterState;
    // Continue traversal until hitting a checked state
    while (!wasChecked(state)){
      path->push_back(state);
      setChecked(state);
      state = nextState(state);
    }
    
    // If there's a cycle
    int cycleLoc = cycle(state, *path);
    if (cycleLoc > -1){
      outputCycle(cycleLoc, *path);
    }
  }
}

// Main method of Cyclone, gets an input file and outputs the limit
// cycles of the PDS in the file
int main(int argc, char *argcv[]){

  reset();
  string filename;
  if (argc < 3){
    cout << "Enter Filename (no extension): " << endl;
    cin >> filename;
    cout << "Enter number of states (3): " << endl;
    cin >> num_states;
  }
  else{
    stringstream temp;
    temp << argcv[1];
    temp >> num_states;
    filename = argcv[2];
  }
  cout << "STATES: " << num_states << endl;
  string filenameOut = filename + "_results.txt";
  filename += ".txt";
  
  //cout << filename << endl;
  num_vars = readInput(filename);
  fileOut = new ofstream(filenameOut.c_str());
 
  int total_states = ceil(pow(num_states,num_vars) / BYTE_SIZE);
  checkedArray = new unsigned char[total_states];
  for (int i = 0; i < total_states; i++){
    checkedArray[i] = 0;
  }    
 
  //printPDS();
  run();  
  
  fileOut->close();
 return 0;
}
