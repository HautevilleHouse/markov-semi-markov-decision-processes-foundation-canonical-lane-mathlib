import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure StationaryPolicy (A : AdmissibleClass) (M : ConstrainedMDP A) where
  decisionRule : M.stateSpace → M.actionSpace
  induceMarkov : MarkovChain M.stateSpace (λ s s' => M.transition s (decisionRule s) s')

structure StationaryPolicyEvidence (A : AdmissibleClass) (M : ConstrainedMDP A) (P : StationaryPolicy A M) where
  deterministicAdmissible : ∀ s, M.constraint s (P.decisionRule s)
  markovChainWellDefined : True

def StationaryPolicyClosed (P : StationaryPolicy A M) : Prop :=
  ∀ s, M.constraint s (P.decisionRule s)

theorem stationary_policy_closed_from_evidence (A : AdmissibleClass) (M : ConstrainedMDP A) (P : StationaryPolicy A M) (E : StationaryPolicyEvidence A M P) : StationaryPolicyClosed P :=
  by
    intro s
    exact E.deterministicAdmissible s

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse