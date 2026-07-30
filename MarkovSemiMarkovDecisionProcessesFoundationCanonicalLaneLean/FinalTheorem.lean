import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.TransitionKernel
import canonicalLaneMathlib.SemiMarkovStructure
import canonicalLaneMathlib.OptimalityCriteria

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

def ConstrainedSemiMarkovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_semi_markov_endgame (A : AdmissibleClass) :
    ConstrainedSemiMarkovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse
