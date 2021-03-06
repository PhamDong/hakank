/**
  *
  * Furniture Moving problem in Choco3.
  *
  * Problem from Marriott & Stuckey: 'Programming with constraints', page  112f
  *
  * Feature: testing cumulative.
  *
  *
  * Choco3 model by Hakan Kjellerstrand (hakank@gmail.com)
  * Also see http://www.hakank.org/choco3/
  *
  */
import org.kohsuke.args4j.Option;
import org.slf4j.LoggerFactory;
import samples.AbstractProblem;
import solver.ResolutionPolicy;
import solver.Solver;
import solver.constraints.Constraint;
import solver.constraints.IntConstraintFactory;
import solver.constraints.IntConstraintFactory.*;
import solver.search.strategy.IntStrategyFactory;
import solver.variables.IntVar;
import solver.variables.BoolVar;
import solver.variables.VariableFactory;
import solver.variables.Task;
import solver.search.strategy.strategy.AbstractStrategy;
import util.ESat;

public class FurnitureMoving extends AbstractProblem {

  @Option(name="-num_persons", usage="number of persons (default 4)", required = false)
  int num_persons = 4;    
  @Option(name = "-show_all", usage = "Show all solutions.", required = false)
  boolean show_all = false;

  @Option(name = "-min_people", usage = "Minimize the number of people.", required = false)
  boolean min_people = false;

  // Global vars (for output)
  IntVar Sp, Sc, Sb, St, MaxEndTime;
  IntVar SpEnd, ScEnd, SbEnd, StEnd;
  IntVar[] starts, ends;
  IntVar[] durations;
  IntVar[] heights;
  IntVar NumPersons;


  @Override 
  public void buildModel() {

    int max_end_time = 60;
    Sp = VariableFactory.bounded("Sp", 0, max_end_time, solver); // Piano
    Sc = VariableFactory.bounded("Sc", 0, max_end_time, solver); // Chair 
    Sb = VariableFactory.bounded("Sb", 0, max_end_time, solver); // Bed
    St = VariableFactory.bounded("St", 0, max_end_time, solver); // Table
    starts = new IntVar[] {Sp,Sc,Sb,St};

    
    SpEnd = VariableFactory.bounded("SpEnd", 0, max_end_time, solver);
    ScEnd = VariableFactory.bounded("ScEnd", 0, max_end_time, solver);
    SbEnd = VariableFactory.bounded("SbEnd", 0, max_end_time, solver);
    StEnd = VariableFactory.bounded("StEnd", 0, max_end_time, solver);
    ends = new IntVar[] {SpEnd, ScEnd, SbEnd, StEnd};

    MaxEndTime = VariableFactory.bounded("MaxEndTime", 0, max_end_time, solver);
    
    int _durations[] = {30,10,15,15};
    durations = new IntVar[_durations.length];
    for (int i = 0; i<_durations.length; i++) {
      durations[i] = VariableFactory.fixed(_durations[i], solver);
    }
    
    int[] _heights = {3,1,3,2};
    heights = new IntVar[_heights.length];
    for(int i = 0; i < _heights.length; i++) {
      heights[i] = VariableFactory.fixed(_heights[i], solver);
    }
       
    // TaskVariables
    Task[] tasks = new Task[starts.length];
    for(int i = 0; i < starts.length; i++){
      tasks[i] = VariableFactory.task(starts[i], durations[i], ends[i]);
    }
    
    if (min_people) {
      NumPersons = VariableFactory.bounded("NumPersons", 1,4, solver);
    } else {
      NumPersons = VariableFactory.fixed(num_persons, solver);
    }
    solver.post(IntConstraintFactory.cumulative(tasks, heights, NumPersons, true));
    
    solver.post(IntConstraintFactory.maximum(MaxEndTime, ends));
    
  } 

  @Override
  public void createSolver() {
    solver = new Solver("FurnitureMoving");
  }
    
  @Override
  public void configureSearch() {
    solver.set(IntStrategyFactory.firstFail_InDomainMin(ends));
  }

  @Override
  public void solve() {
    if (show_all) {
      solver.findSolution();
    } else {
      if (min_people) {
        solver.findOptimalSolution(ResolutionPolicy.MINIMIZE, NumPersons);
      } else {
        solver.findOptimalSolution(ResolutionPolicy.MINIMIZE, MaxEndTime);
      }
    }

  }


  @Override
  public void prettyOut() {

    if (solver.isFeasible() == ESat.TRUE) {
      
      do {
        System.out.println("\nSolution:");
        System.out.println("NumPersons:" + NumPersons.getValue());
        System.out.println("MaxEndTime: " + MaxEndTime.getValue());
        System.out.println("Piano: " + Sp.getValue()  + ".." + SpEnd.getValue() + "(" + heights[0] + " pers)");                          
        System.out.println("Chair: " + Sc.getValue() + ".." + ScEnd.getValue() + "(" + heights[1] + " pers) ");
        System.out.println("Bed: " + Sb.getValue() + ".." + SbEnd.getValue() + "(" + heights[2] + " pers)");
        System.out.println("Table: " + St.getValue() + " - " + StEnd.getValue() + "(" + heights[3] + " pers)");
        System.out.println();
        
      } while (solver.nextSolution() == Boolean.TRUE);
      
    } else {
      System.out.println("Problem is not feasible!");
    }
  }  
  
  
  public static void main(String args[]) {
    new FurnitureMoving().execute(args);
  }
  
  
} // end class
  