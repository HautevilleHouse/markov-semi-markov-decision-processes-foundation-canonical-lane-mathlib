import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure MDPOptimality (A : AdmissibleClass) (M : ConstrainedMDP A) where
  policy : M.stateSpace → M.actionSpace → ℝ
  valueFunction : M.stateSpace → ℝ
  optimalityInequality : ∀ s, valueFunction s ≤ (⨅ a, M.reward s a + ∑ s', M.transition s a s' * valueFunction s')

structure MDPOptimalityEvidence (A : AdmissibleClass) (M : ConstrainedMDP A) (O : MDPOptimality A M) where
  policyAdmissible : ∀ s, O.policy s (·) ∈ {p | ∑ a, p a = 1 ∧ ∀ a, p a ≥ 0}
  optimalityClosed : ∀ s, O.optimalityInequality s

def MDPOptimalityClosed (O : MDPOptimality A M) : Prop :=
  ∀ s, O.optimalityInequality s

theorem mdp_optimality_closed_from_evidence (A : AdmissibleClass) (M : ConstrainedMDP A) (O : MDPOptimality A M) (E : MDPOptimalityEvidence A M O) : MDPOptimalityClosed O :=
  by
    intro s
    exact E.optimalityClosed s

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse