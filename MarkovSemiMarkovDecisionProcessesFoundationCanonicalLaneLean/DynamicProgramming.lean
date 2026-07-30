import HautevilleHouse.MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.OptimalityCriteria

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure DynamicProgrammingPackage where
  valueIterationConvergence : Prop
  policyIterationConvergence : Prop
  optimalityEquations : Prop
  fixedPointCharacterization : Prop

structure DynamicProgrammingEvidence (D : DynamicProgrammingPackage) where
  valueIterationConvergenceClosed : D.valueIterationConvergence
  policyIterationConvergenceClosed : D.policyIterationConvergence
  optimalityEquationsClosed : D.optimalityEquations
  fixedPointCharacterizationClosed : D.fixedPointCharacterization

def DynamicProgrammingClosed (D : DynamicProgrammingPackage) : Prop :=
  D.valueIterationConvergence ∧ D.policyIterationConvergence ∧ D.optimalityEquations ∧ D.fixedPointCharacterization

theorem dynamic_programming_closed_from_evidence (D : DynamicProgrammingPackage) (E : DynamicProgrammingEvidence D) :
    DynamicProgrammingClosed D :=
  And.intro E.valueIterationConvergenceClosed
    (And.intro E.policyIterationConvergenceClosed
      (And.intro E.optimalityEquationsClosed E.fixedPointCharacterizationClosed))

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse
