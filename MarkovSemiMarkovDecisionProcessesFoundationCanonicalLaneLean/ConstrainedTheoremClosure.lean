import MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.BridgeLemmas
import MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

def ConstrainedMarkovSemiMarkovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_semi_markov_endgame (A : AdmissibleClass) :
    ConstrainedMarkovSemiMarkovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse