#!/usr/bin/perl
print "Content-type: text/html\n\n";
print <<ENDHTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>
			ADAM User Guide
		</title>
		<link rel="stylesheet" type="text/css" href="adam_style.css">
	</head>
	<body>
		<div id="header">
ENDHTML

$header = &Constant_HTML('header.html');
print $header;
print <<ENDHTML;
		</div>
		<div id="main">
			<div id="nav">
ENDHTML

$navigation = &Constant_HTML('navigation.html');
print $navigation;
print <<ENDHTML;
				<h1>
					<font face="Verdana, Arial, Helvetica, sans-serif">Analysis of Discrete Algebraic Models User Guide</font>
				</h1>
				<p>
					<a name="top" id="top"></a>
				</p>
				<ul>
					<li>
						<a href="#Overview"><font face="Verdana, Arial, Helvetica, sans-serif">Overview</font></a>
					</li>
					<li>
						<a href="#LM"><font face="Verdana, Arial, Helvetica, sans-serif">How to Analyze a Logical Model (generated with GINsim)</font></a>
					</li>
					<li>
						<a href="#PDS"><font face="Verdana, Arial, Helvetica, sans-serif">How to Analyze a Polynomial Dynamical System (PDS)</font></a>
					</li>

                                 	<li>
						<a href="#PDSep"><font face="Verdana, Arial, Helvetica, sans-serif">How to Analyze a Polynomial Dynamical System with External Parameters (PDSep)</font></a>
					</li>


					<li>
						<a href="#PBN"><font face="Verdana, Arial, Helvetica, sans-serif">How to Analyze a Probabilistic Network</font></a>
					</li>

                                        <li>
						<a href="#SDDS"><font face="Verdana, Arial, Helvetica, sans-serif">How to Analyze a Stochastic Discrete Dynamical System (SDDS)</font></a>
					</li>

					<li>
						<a href="#ModelType"><font face="Verdana, Arial, Helvetica, sans-serif">What is the <i>Model Type</i>?</font></a>
					</li>
					<li>
						<a href="#ModelInput"><font face="Verdana, Arial, Helvetica, sans-serif">What is the <i>Model Input</i>?</font></a>
					</li>
					<li>
						<a href="#Analysis"><font face="Verdana, Arial, Helvetica, sans-serif">What are the different <i>Analysis</i> Options?</font></a>
					</li>
					<li>
						<a href="#numStates"><font face="Verdana, Arial, Helvetica, sans-serif">What is the <i>number of states per node</i>?</font></a>
					</li>
					<li>
						<a href="#DG"><font face="Verdana, Arial, Helvetica, sans-serif">What is the <i>Dependency Graph</i>?</font></a>
					</li>
					<li>
						<a href="#PrintProb"><font face="Verdana, Arial, Helvetica, sans-serif">What is <i>Print Probabilities</i>?</font></a>
					</li>
					<li>
						<a href="#SS"><font face="Verdana, Arial, Helvetica, sans-serif">What is the <i>State Space Graph</i>?</font></a>
					</li>
					<li>
						<a href="#update"><font face="Verdana, Arial, Helvetica, sans-serif">What is the <i>Updating Scheme</i>?</font></a>
					</li>
					<li>
						<a href="#sim"><font face="Verdana, Arial, Helvetica, sans-serif">What is the <i>Simulation Option</i>?</font></a>
					</li>
					<li>
						<a href="#length"><font face="Verdana, Arial, Helvetica, sans-serif">What is <i>Limit Cycle Length</i></font></a>
					</li>
					<li>
						<a href="#circ"><font face="Verdana, Arial, Helvetica, sans-serif">What is <i>Feedback Circuit</i> output option?</font></a>
					</li><!-- <li>
						<a href="#O"><font face="Verdana, Arial, Helvetica, sans-serif">What is <i>Signed Edges</i> output option?</font></a>
					</li> -->
					<li>
						<a href="#boolean"><font face="Verdana, Arial, Helvetica, sans-serif">What is Boolean Input Format?</font></a>
					</li>
					<li>
						<a href="#how"><font face="Verdana, Arial, Helvetica, sans-serif">How is the Analysis without Simulation implemented?</font></a>
					</li>
					<li>
						<a href="#slow"><font face="Verdana, Arial, Helvetica, sans-serif">What if the Analysis is too Slow?</font></a>
					</li>
					<li>
						<a href="#src"><font face="Verdana, Arial, Helvetica, sans-serif">Where can I get the source code?</font></a>
					</li>
					<li>
						<a href="#authors"><font face="Verdana, Arial, Helvetica, sans-serif">Who contributes to ADAM?</font></a>
					</li>
					<li>
						<a href="#Ref"><font face="Verdana, Arial, Helvetica, sans-serif">References</font></a>
					</li>
				</ul>
				<hr>
				<h3>
					<a name="Overview" id="Overview">Overview</a>
				</h3>
				<p>
					ADAM is a web-based tool for the analysis and visualization of the dynamics of multi-state, discrete models of biological networks. Multi-state discrete models are characterized by a collection of functions. For a network of <i>n</i> nodes, the corresponding discrete model will have <i>n</i> functions, where the <i>i</i>-th function describes the state transitions of the <i>i</i>-th node in the network. The user may select one of four inputs: a GINsim file, a PDS (polynomial dynamical system), a PDSep (polynomial dynamical system with external parameters), a PBN (probabilistic Boolean network), or an SDDS (stochastic discrete dynamical system). The user may upload a file or enter functions into the text box. Based upon which input type the user selects, other input options may appear. The user is guided through additional input/output options. ADAM can calculate fixed points and limit cycles of a specified length, produce the dependency graph for all networks and the state space for networks which are simulated, the graph of trajectories starting from a given initial state, and identify functional circuits along with their signed edges. ADAM analyzes dynamics using a combination of simulation and abstract algebra techniques. The method of computation and the output will depend on options selected by the user.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="LM" id="LM">How to Analyze a Logical Model (generated with GINsim)</a>
				</h3>
				<p>
					<img src="UserGuide_files/phageLambda.png" alt="Logical Model of Phage Lambda" align="left">ADAM can analyze Logical Models generated with <a href="http://gin.univ-mrs.fr/">GINsim</a>. GINsim is a program to build a logical model for a biological system such as a gene regulatory network. Internally, ADAM converts a logical model to a polynomial dynamical system (PDS) via the method described in Veliz-Cuba et al., 2010<sup>1</sup> and then uses techniques from abstract algebra to analyze the PDS for key dynamics. ADAM will assign <i>x1</i> to <i>xn</i> to the variables used in the logical model, and states of the dynamic model are represented as vectors, where the first entry corresponds to the variable assigned to x1, and so on. For example, the logical model of <a href="http://gin.univ-mrs.fr/GINsim/model_repository/MICROBIOLOGICAL%20REGULATORY%20NETWORKS/Phage%20Lambda/PhageLambda/description.html">Phage Lambda</a> (left) is converted to the following PDS. ADAM determines the number of states per variable from the logical model, in this example, there are 5 different states per variable.<br>
				</p>
				<center>
					<img src="UserGuide_files/phageLambdaPDS.png" alt="PDS of Phage Lambda" style="border:1px solid black;"><br>
				</center><br>
				The Logical Model can be analyzed (using <i>Algorithms</i> or <i>Simulation</i>). This Phage Lambda model has one fixed point or steady state, represented as <i>(2 0 0 0)</i>. This means, that C1 is 2, a medium concentration, because the first (<i>x<b>1</b></i> = C1) entry is 2, and the other three variables are 0, i.e., not expressed at all.<br>
				<br>
				Note: Currently ADAM is only compatible with GINsim 2.3. Please use GINsim version 2.3 to generate your models in order to analyze them with ADAM.
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="PDS" id="PDS">How to Analyze a Polynomial Dynamical System (PDS)</a>
				</h3>
				<p>
					The user can upload a text file (.txt) or directly enter the functions of a PDS. The <i>number of states per node</i> must be specified. It denotes the cardinality of the state set of the user's discrete network. Note that this must be a prime number. The software accepts positive prime integers up to 99. This value gives the total number of states that a node in the network can have. For example, if <i>number of states per node</i> = 3, then the possible states for any node are 0, 1, and 2. If the system is <b>Boolean</b>, i.e., the number of states per node is 2, then ADAM accepts functions in polynomial form, or in Boolean form (see <a href="#boolean">Boolean Input Format</a>).
				</p>
				<p>
					Each node of the user's network is represented by a variable. Variable names are <i>x1</i>, <i>x2</i>, etc. Function names are <i>f1</i>, <i>f2</i>, etc. The convention is that <i>fk</i> is the function which describes the state transitions of the node represented by <i>xk</i>. ADAM will use the functions from the input text box only when the user DOES NOT select a file to upload. The functions should follow the following formatting rules:
				</p>
				<ul>
					<li>The functions should begin with <i>f</i> followed by an integer, example <i>f1</i>, <i>f2</i>, <i>f3</i>,...,<i>fn</i>, where <i>n</i> is the number of variables
					</li>
					<li>Use * for multiplication, + for additions and ^ for exponents.
					</li>
					<li>The variables should begin with <i>x</i> followed by an integer, example <i>x1</i>, <i>x2</i>, <i>x3</i>,...,<i>xn</i>, where <i>n</i> is the number of states
					</li>
				</ul>
				<p>
					The PDS can be analyzed (using <i>Algorithms</i> or <i>Simulation</i>). For small networks (less than 10 nodes), the complete state space can be simulated and all attractors (fixed points and limit cycles) are found. In addition to that, the size of each component, i.e., the basin of attraction, are determined. For larger networks, a simulation of the complete state space is not possible. Instead, ADAM uses tools from computational algebra, to find all fixed points or limit cycles of a given length. The algorithms that ADAM uses are fast for sparse systems, a structure maintained by most biological systems. ADAM can easily compute fixed points for systems with 50 or 100 nodes, as long as every node has only a few neighbors in the wiring diagram, i.e., only a few variables appear in each function.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>

                                <h3>
					<a name="PDSep" id="PDSep">How to Analyze a Polynomial Dynamical System with External Parameters (PDSep)</a>
				</h3>
				<p>
					The user can upload a text file (.txt) or directly enter the functions of a PDS in which the external parameters can take place. The user can also specify any number of external parameters that can affect the system. The <i>number of states </i> must be specified. It denotes the maximum number of discrete values that all variables in the system (including <i>external parameters</i>) can take on. Note that this must be a prime number up to 99. For example, if <i>number of states per node</i> = 3, then the possible states for any node are 0, 1, and 2. 
				</p>
				<p>
					Each node of the user's network is represented by a variable. Variable names are <i>x1</i>, <i>x2</i>, etc. Function names are <i>f1</i>, <i>f2</i>, etc. The convention is that <i>fk</i> is the function which describes the state transitions of the node represented by <i>xk</i>. ADAM will use the functions from the input text box only when the user DOES NOT select a file to upload. The functions should follow the following formatting rules:
				</p>
				<ul>
					<li>The functions should begin with <i>f</i> followed by an integer, example <i>f1</i>, <i>f2</i>, <i>f3</i>,...,<i>fn</i>, where <i>n</i> is the number of variables
					</li>
					<li>Use * for multiplication, + for additions and ^ for exponents.
					</li>
					<li>The variables should begin with <i>x</i> followed by an integer, example <i>x1</i>, <i>x2</i>, <i>x3</i>,...,<i>xn</i>, where <i>n</i> is the number of states
					</li>
                                       	<li>The external parameters can be anything but it is better not to begin with <i>x</i> followed by an integer as the variables. For example, it can be N, Mg, NO3, pH, etc. The name of the specified external parameter must be exactly the same the one taking place in the functions.
					</li>
				</ul>
				<p>
					The PDSep can be analyzed using <i>Algorithms</i> or <i>Simulation</i>. For small networks (less than 10 nodes), the complete state space can be simulated and all attractors (fixed points and limit cycles) are found. In addition to that, the size of each component, i.e., the basin of attraction, are determined. For larger networks, a simulation of the complete state space is not possible. The algorithms that ADAM uses are fast for sparse systems; if every node has many neighbors in the wiring diagram, ADAM may need some time to complete the analysis.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>

				<h3>
					<a name="PBN" id="PBN">How to Analyze a Probabilistic Network</a>
				</h3>
				<p>
					<img src="UserGuide_files/PBN_SS.gif" width="350" alt="sample probabilistic network" align="left">ADAM can visualize the state space of a (small) probabilistic network. In the state space of a probabilistic network, all possible transitions from one state to the next are drawn, together with their probability, if <i>Print Probabilities</i> is checked. The <i>number of states per node</i> must be specified. It denotes the cardinality of the state set of the user's discrete network. Note that this must be a prime number. The software accepts positive prime integers up to 99. This value gives the total number of states that a node in the network can have. For example, if <i>number of states per node</i> = 3, then the possible states for any node are 0, 1, and 2. If the system is Boolean, i.e., the number of states per node is 2, then ADAM accepts functions in polynomial form, or in Boolean form (see <a href="#boolean">Boolean Input Format</a>).<br>
					<br>
					Probabilistic Networks can be entered by using <b>{</b> and <b>}</b> around several possible functions for one variable. If not specified, the functions have uniform probability, if the user wants to impose a distribution on the functions, the probability can be specified behind the function, separated with the pound symbol, <b>#</b>.<br>
				</p>
				<center>
					<img src="UserGuide_files/PBN.png" alt="sample probabilistic network"><br>
				</center>In probabilistic networks, fixed points are defined as state that <i>could</i> remain the same when updated. The <i>stability</i> of a fixed point is its probability to not change in the next iteration. Fixed points with stability 1 are <b>true fixed points</b>, as they can never transition to another state. ADAM determines true fixed points of probabilistic networks by simulation for smaller networks, or by using algorithms from computational algebra for systems too complex for simulation. Bounded Petri Nets can be represented as probabilistic networks<sup>1</sup>. In the terminology of petri nets, fixed points with stability one are <b>deadlocks</b>.
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>

                                <h3>
					<a name="SDDS" id="SDDS">How to Analyze a Stochastic Discrete Dynamical System (SDDS)</a>
				</h3>
				<p>
					If the user would like to upload a text file (.txt) for the <b>complete transition table</b> corresponding to their network, then it consists of all possible states and the their future states with delimiter, an arrow (->). For example, the complete transition table of a 3-node boolean network can be:
                                </p>
                                <ul>
					<li>0 0 0 -> 0 1 0</li>
                                        <li>0 0 1 -> 0 1 1</li>
                                        <li>0 1 0 -> 0 1 0</li>
                                        <li>0 1 1 -> 0 0 0</li>
                                        <li>1 0 0 -> 1 1 0</li>
                                        <li>1 0 1 -> 1 0 1</li>
                                        <li>1 1 0 -> 0 0 1</li>
                                        <li>1 1 1 -> 0 0 0</li>
				</ul>
                                <p>
                                        Note that the states consist of numbers not more than 2, because this is a boolean network, i.e. the number of states for this network is 2.
				</p>
                                <p>
					If the user would like to upload a text file (.txt) for the <b>functions</b> instead of the complete transition table, then the functions file consists of the updating functions of all variables. For example, the functions of a 3-node boolean network can be:
                                </p>
                                <ul>
					<li>f1 = x1 + 1</li>
                                        <li>f2 = x1 * x3 + x2 ^ 2</li>
                                        <li>f3 = x2 + x3 ^ 3</li>
				</ul>
                                <p>
                                        Here, f1 indicates the updating function of the first variable, denoted by x1. Similarly, f2 indicates the updating function of the second variable, denoted by x2, and f2 indicates the updating function of the third variable, denoted by x3. Note that the number of functions must be equal to the number of variables.
                                </p>
                                <p>
                                        The user enters the <b>propensity matrix</b> entries. If they do not know the propensity matrix paramaters or want to get random simulations, then all entries of the propensity matrix should be 0.5. In the propensity matrix, the number of rows must be the number of nodes (variables) in the network, and the number of columns must be 2 that the first column is for activation and the second column is for degredation propensity. Propensity entries must be seperated by a space and a number between 0 and 1. The sum of the activation and degradation of a node does not have to be equal to 1. For example, the propensity matrix of a 3-node boolean network must have 3 rows and 2 colums and can be:
				</p>
                                <ul>
					<li>0.57  0.05</li>
                                        <li>0.40  0.70</li>
                                        <li>0.85  0.15</li>
				</ul>
				<p>
					Therefore, for the <b>first</b> node, 0.57 is the <b>activation propensity</b>, 0.05 is the <b>degradation propensity</b>; for the <b>second</b> node, 0.40 is the <b>activation propensity</b>, 0.70 is the <b>degradation propensity</b>; for the <b>third</b> node, 0.85 is the <b>activation propensity</b>, 0.15 is the <b>degradation propensity</b>. "Activation Propensity" is the probability that the variable is being activated (increased) at the next time step. Similarly, "Degradation Propensity" is the probability that the variable is being degraded(decreased) at the next time step.
				</p>
                                <p>
                                        Note that for random simulations, the propensity matrix of a 3-node boolean network must be:
                                </p>
                                <ul>
					<li>0.5 0.5</li>
                                        <li>0.5 0.5</li>
                                        <li>0.5 0.5</li>
				</ul>
				<p>
					The user specifies the <b>initial state</b>, which is the starting point for all trajectories and simulations for their system. An initial state consists of integers at least 0 and less than number of states and these numbers must be separated by a space. The number of integers in the initial state must be equal to the number of nodes (variables) in the network. For example, the initial state of a 3-node boolean network can be: 0 1 1 but cannot be: 0 1.
                          	</p>
				<p>
					The user specifies the <b>nodes of interest</b>, which consists of integers between 1 and the number of nodes (variables) and commas as delimiter. The nodes of interest indicates of which nodes the user would like to see the behavior in the plot of cell population simulation. The user must enter at least 1 and can enter at most 5 nodes of interest. For example, in a 3-node boolean network, if the nodes of interest is 1, 3, then node1 and node3 will be shown in the plot of cell population simulation.
                          	</p>
				<p>
					The user specifies the <b>number of states</b> determining how many values a state can have. It must be prime and not more than 20. For example, the number of states is 2 for a boolean network. If the number of states is 3, then the states for any node are 0, 1, and 2.
                          	</p>
				<p>
					The user specifies the <b>number of steps</b> determining how many states there are after the initial state in a trajectory. It must be a number more than 1000. For example, if the number of steps are 3, then the lenght of each trajectory is 4, because the first state in the trajectory is the initial state, the second state is the next state of the first state, the third state is the next state of the second state, and the forth (and the last state) is the next state of the third state. The next states re computed using transition table or functions, and propensity matrix.
                          	</p>
				<p>
					The user specifies the <b>number of simulations</b> determining how many simulations is needed for the system. It must be number not more than 1000000 (a million). For instance, the number of simulations can be 1 if the user would like to see only 1 cell population simulation. If the number of simulations is 50, then 50 trajectories starting with the initial state will be constructed and then the average behavior of each nodes and the frequency of some of the states will be provided.
                          	</p>
				<p>
					The SDDS is analyzed (using "Plot of cell population simulation and Histogram for probability distribution). The <b>plot of cell population simulation</b> shows what the behavior of the nodes of interest are. It can be interpreted from the plot whether the node oscillates or approaches to a certain value. However, the <b>histogram for probability distribution</b> indicates how frequently the states show up in the trajectories. The state and its frequency will not be shown if the frequency is less than 1.
                          	</p>
				<p>
					ADAM will provide what the steady states are for the system if the user checks "<b>Print Steady States</b>", and probability transition matrix if the user checks "<b>Print Probability Transition Matrix</b>". A steady state is the state where the system does not change in time. In the example given for the (complete) transition table, the steady states for that system are 0 1 0 and 1 0 1. However, a probability transition matrix is a huge structure provides the probability of going each state to all possible states. Only <b>nonzero</b> probabilities will be provided, i.e. if the probability of going from a state to another is 0, then it will not be shown in the probability transition matrix. Besides, the sum of all transition probabilities from any specific state to all states must be 1. Here is an example for the probability transition matrix of a 3-node boolean network:
                                <ul>
					<li>Pr (0 0 0 -> 0 0 0) = 0.1</li>
                               	        <li>Pr (0 0 0 -> 1 0 0) = 0.3 </li>
					<li>Pr (0 0 0 -> 0 1 0) = 0.6</li>

                               	        <li>Pr (0 0 1 -> 0 1 1) = 0.5 </li>
					<li>Pr (0 0 1 -> 1 1 0) = 0.5</li>

                               	        <li>Pr (0 1 0 -> 0 1 0) = 1 </li>

                                        ... (continues...)

				</ul>
                                <p>
                                        Pr (0 0 0 -> 0 0 0) = 0.1 indicates that the probability of transitioning from 0 0 0 to 0 0 0 itself is 0.1. In addition, 0 0 1 transitions to 0 1 1 and 1 1 0 with the probability 0.5. Since 0 1 0 is one of the steady states, the probability of transitioning from 0 1 0 to itself is of course 1. Note that the sum of all transition probabilities for 0 0 0 is 1 (= 0.1 + 0.3 + 0.6).
                          	</p>

				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>

				<h3>
					<a name="ModelType" id="ModelType">What is the <i>Model Type</i>?</a>
				</h3>
				<p>
					ADAM can analyze a logical Model (.ginml file generated with <a href="http://gin.univ-mrs.fr/">GINsim</a>), a polynomial dynamical system (PDS), or a probabilistic network.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="ModelInput" id="ModelInput">What is the <i>Model Input</i>?</a>
				</h3>
				<p>
					The user can upload the model as a file, or, for PBS or PN, enter it directly. Logical Models must be provided as <i>.ginml</i> files, PBS and PN as <i>.txt</i> files.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="Analysis" id="Analysis">What are the different <i>Analysis</i> Options?</a>
				</h3>
				<p>
					ADAM will simulate dynamics for the <i>Simulation</i> option (11 nodes or less), meaning it computes the transition states from all possible initializations. When simulating, ADAM will output the analysis results as well as the graph of the state space. For <i>Algorithms</i> ADAM uses algebra to solve for fixed points and limit cycles of a specified length. ADAM uses a separate algorithm to compute dynamics in the case of <i>Conjunctive/Disjunctive</i> Networks. Conjunctive Boolean networks consist of functions containing only one monomial term, i.e. the functions use only the AND operator. Conversely, Disjunctive Boolean networks consist of functions which use only the OR operator. Note that the <i>Conjunctive/Disjunctive</i> option only works for functions defined in a Boolean ring, i.e. there can be only two states per node. (see <a href="#numStates">What is the <i>number of states per node</i>?</a>) Furthermore, <i>Conjunctive/Disjunctive</i> networks currently works only for strongly connected graphs. When input is analyzed with either the <i>Algorithms</i> or <i>Conjunctive/Disjunctive network</i> option, ADAM displays the fixed points and limit cycles in a table.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="numStates" id="numStates">What is the <i>number of states per node</i>?</a>
				</h3>
				<p>
					The states, or varying levels of concentration a protein may have or gene expression levels. If the number of states per node of a model is 2, then it is a Boolean model, with genes being either on, 0, or off, 1. In a model with 3 states, 0 can represent the state in which a gene is not expressed, 1 a gene with a medium expression level, and 2 a high level. 
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="DG" id="DG">What is the <i>Dependency Graph</i>?</a>
				</h3>
				<p>
					The <b>dependency graph</b> or <b>wiring diagram</b> shows the static relationship between the nodes by directed edges. A directed edge from variable <i>xi</i> to <i>xj</i> means that <i>xi</i> affects the state of <i>xj</i>. In ADAM, all edges in the dependency graph are functional.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="PrintProb" id="PrintProb">What is <i>Print Probabilities</i>?</a>
				</h3>
				<p>
					For probabilistic networks, ADAM can print the probability for each transition in the state space. See <a href="#PBN">Probabilistic Networks</a>.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="SS" id="SS">What is the <i>State Space Graph</i>?</a>
				</h3>
				<p>
					The state space is a graph where the nodes are the states of the system, and the arrows indicate, how the state dynamically change with each iteration.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="update" id="update">What is the <i>Updating Scheme</i>?</a>
				</h3>
				<p>
					This will determine the order in which to evaluate the functions.<br>
				</p>
				<ul>
					<li>
						<b>Synchronous</b>: all functions get evaluated at the same time
					</li>
					<li>
						<b>Sequential</b>: the functions are evaluated in some specified order. The function indices must be entered in the input box provided with each index used exactly once and should be in the range 1 to n (number of nodes)
					</li>
					<li style="list-style: none">For all polynomial dynamical systems asynchronous/synchronous updating yields the same fixed points. This is particularly helpful for the logical modeling community because most of their updating is done asynchronously. Note that this option applies only to <i>PDS</i>.
					</li>
				</ul>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="sim" id="sim">What is the <i>Simulation Option</i>?</a>
				</h3>
				<p>
					If the user selects the option to view the <i>Complete State Space</i>, the software computes the number of connected components in the state space, as well as some statistics of the components. It displays the number of states in a component and the length of the cycle. (Since these discrete models are finite, each component necessarily has a cycle. Because the models are deterministic - they are characterized by a set of rules, given by functions - there is only one cycle per component.) If there are fixed points (i.e., cycles of length 1), then it prints the state, along with the size of its component. If the user selects the option to view the graphs, the corresponding links will be displayed which will show the graph.
				</p>
				<p>
					<img src="UserGuide_files/traj.gif" align="left" alt="Visualization of a trajectory"> The user can view the trajectory of one initialization only, if he selects that option. The input text box next to the option is where the user needs to provide the initialization. The states in the initialization should be separated by spaces. For example 1 0 0 0 1 , 2 0 3 2 1 or 11 12 10 0 1. It is important to separate the states by spaces in order for the software to distinguish between the different states. On clicking <i>Analyze</i>, the trajectory will be printed in a vertical fashion (one on each line) and will stop once it finds a repeated pattern. If the user has selected the option to view the state space graph, a link will be displayed which will show the graph and the cycle will be colored. The initial states provided by the user will be in the box shaped node. Below is a snapshot of the trajectory generated using example functions from Figure a with initialization 2 0 1. Single trajectories can be computed and visualized, when the network is too complex to generate the complete state space.<br>
					<br>
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="length" id="length">What is <i>Limit Cycle Length</i>?</a>
				</h3>
				<p>
					For large networks, the user has to specify the length of limit cycles that ADAM is computing. Limit cycles of length 1 are the same as fixed points.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="circ" id="circ">What is <i>Feedback Circuit</i> output option?</a>
				</h3>
				<p>
					ADAM can analyze the model for feedback circuits. It will list all functional circuits.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div><!-- <h3>
									<a name="signed" id="signed">What is <i>Signed Edges</i> output option?</a>
								</h3>
								<p>
									TODO
								</p>
								<div align="right">
									<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
								</div> -->
				<h3>
					<a name="boolean" id="boolean">What is Boolean Input Format?</a>
				</h3>
				<p>
					ADAM provides the user withs the option to specify how the operations in the function file should be interpreted. For example, 'x1*x2' could be interpreted as polynomial multiplication of variables or as the Boolean AND operation. If the user provides functions that are in the Boolean format, ADAM will convert the Boolean functions to polynomial functions to do the computations. This only works, when <i>number of states per node</i> is 2. The Boolean function file must adhere to the following format:<br>
					<br>
				</p>
				<center>
					<table border="1" cellpadding="10" cellspacing="0" summary="Boolean input">
						<tr>
							<td>
								<b>Boolean operator</b>
							</td>
							<td>
								<b>Written as</b>
							</td>
						</tr>
						<tr>
							<td>
								<center>
									AND
								</center>
							</td>
							<td>
								<center>
									*
								</center>
							</td>
						</tr>
						<tr>
							<td>
								<center>
									OR
								</center>
							</td>
							<td>
								<center>
									+
								</center>
							</td>
						</tr>
						<tr>
							<td>
								<center>
									NOT
								</center>
							</td>
							<td>
								<center>
									~
								</center>
							</td>
						</tr>
					</table>
				</center>
				<p>
					<br>
					The Boolean functions should also be <u>fully bracketed infix expressions</u>. For example, the Boolean function<br>
					<br>
				</p>
				<center>
					x1 OR x3 OR (x2 AND NOT x3)
				</center>
				<p>
					<br>
					should be entered as<br>
					<br>
				</p>
				<center>
					((x1+x3)+(x2*(~x3)))
				</center>
				<p>
					<br>
					or<br>
					<br>
				</p>
				<center>
					(x1+(x3+(x2*(~x3))).
				</center>
				<p>
					<br>
					In particular, please do <b>not</b> use unnecessary parenthesis. For example, the following is interpreted wrongly because of the extra parenthesis around x1:<br>
					<br>
				</p>
				<center>
					(x1*((x1)+x2)).
				</center>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="how" id="how">How is the Analysis without Simulation implemented?</a>
				</h3>
				<p>
					There are two options for analysis without simulation. The first is specifically for conjunctive/disjunctive networks. If the user has a Boolean network consisting solely of AND operators (conjunctive) or solely of OR operators (disjunctive), then ADAM will compute the number of fixed points and limit cycles according to algorithms from Salam Jarrah et al.<sup>2</sup>. It will also output what the fixed points and limit cycles are using Gröbner basis computations.
				</p>
				<p>
					The second option is for general networks. For networks that are too large to analyze with simulation, we use Gröbner bases. The user specifies a limit cycle length they would like to find, and our algorithm finds all limit cycles of that length.
				</p>
				<p>
					In the worst case, computing Gröbner bases for a polynomial system has a complexity of doubly exponential in the number of solutions to the system. However, in practice Gröbner bases are computable in a reasonable time. Furthermore, for sparse systems in a finite field it is actually fairly quick. It has been shown that computing Gröbner bases in modular form is much faster in general. <sup>3</sup> In addition, sparse polynomials mean that simpler S-polynomials, usually of comparable length, will be added to the basis, which means less computation is involved. In short, the sparse structure of biological systems is preserved by Gröbner bases, causing our algorithms to be both efficient and fast.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="slow" id="slow">What if the Analysis is too Slow?</a>
				</h3>
				<p>
					If the analysis is too slow, it is probably due to a combination of: having too many nodes in the network, having functions that are too dense, and searching for limit cycle lengths that are too long. Finding a limit cycle of length <i>n</i> involves composing the system of equations <i>n</i> times - this means functions become more dense as <i>n</i> increases. As explained in <a href="#how">How is the Analysis without Simulation implemented?</a>, the Gröbner basis algorithm is faster for sparse polynomials.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="src" id="src">Where can I get the source code?</a>
				</h3>
				<p>
					The source code is not on a public repository at the moment. If you would like a copy of it, please e-mail <a href="mailto:fhinkel@vt.edu">Franziska Hinkelmann</a> for now.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="authors" id="authors">Who contributes to ADAM?</a>
				</h3>
				<p>
					<a href="mailto:fhinkel@vt.edu">Please email us if you have any problems!</a><br>
					<font face="Verdana, Arial, Helvetica, sans-serif">
                                        Madison Brandon<br>
					Nick Eriksson<br>
					Bonny Guang<br>
					Abdul Jarrah<br>
					Franziska Hinkelmann<br>
					Reinhard Laubenbacher<br>
					Rustin McNeill<br>
					Brandilyn Stigler<br>
					Hussein Vastani<br>
                                        Seda Arat<br> 
					<a href="http://img10.imageshack.us/img10/9024/p7080016crop.png">Chuck</a><br></font>
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h3>
					<a name="Ref" id="Ref">References</a>
				</h3>
				<p>
					<sup>1</sup>Veliz-Cube A., Salam Jarrah A., Laubenbacher R., (2010) Polynomial Algebra of Discrete Models in Systems Biology.<br>
					<sup>2</sup>Salam Jarrah A., Laubenbacher R., Veliz-Cuba A., (2008) The Dynamics of Conjunctive and Disjunctive Boolean Network Models. <i>Bioinformatics</i><br>
					<sup>3</sup>Brown W.S. (1971) On Euclid's Algorithm and the Computation of Polynomial Greatest Common Divisors. <i>Journal of the ACM</i>.
				</p>
				<div align="right">
					<a href="#top"><font size="-1" color="#FF0000">Return to the top</font></a>
				</div>
				<h2>
					<a href="adam.pl">Back to ADAM</a>&nbsp;&nbsp;&nbsp; <a href="steptutorial.pl">Step-by-step tutorial</a>
				</h2>
			</div>
		</div>
	</body>
</html>

ENDHTML

# read in a file to include it
sub Constant_HTML {
  local(*FILE); # filehandle
  local($file); # file path
  local($HTML); # HTML data

  $file = $_[0] || die "There was no file specified!\n";

  open(FILE, "<$file") || die "Couldn't open $file!\n";
  $HTML = do { local $/; <FILE> }; #read whole file in through slurp #mode (by setting $/ to undef)
  close(FILE);

  return $HTML;
}
