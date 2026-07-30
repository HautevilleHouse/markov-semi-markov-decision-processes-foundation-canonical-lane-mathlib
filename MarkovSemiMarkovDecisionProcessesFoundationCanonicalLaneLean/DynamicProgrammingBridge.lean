import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.DecisionProcessCore

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure DynamicProgrammingResults (S : SemiMarkovDecisionProcess) where
  bellmanEquation : (s : S.stateSpace) → ℝ
  bellmanOptimality : (s : S.stateSpace) → (
    bellmanEquation s = max (fun (a : S.actionSpace) => 
      S.rewardRate s a + S.discountRate * (∫ t, (S.transitionKernel s a s t) * (bellmanEquation s) dt)))
  convergence : ∃ V, ∀ s, (sequence of iterates) → V s = bellmanEquation s

theorem policyIterationConverges (S : SemiMarkovDecisionProcess) (dp : DynamicProgrammingResults S) :
  ∃ π : AdmissiblePolicy S, ∀ s, dp.bellmanEquation s = 
    S.rewardRate s (π.stateActionFunction s) + S.discountRate * 
      (∫ t, (S.transitionKernel s (π.stateActionFunction s) s t) * (dp.bellmanEquation s) dt) := by
  sorry

theorem valueIterationConverges (S : SemiMarkovDecisionProcess) (dp : DynamicProgrammingResults S) :
  ∀ ε > 0, ∃ n, ∀ s, |dp.bellmanEquation s - (iterate n) dp.bellmanEquation s| < ε := by
  sorry

theorem optimalPolicyExists (S : SemiMarkovDecisionProcess) (dp : DynamicProgrammingResults S) :
  Nonempty (AdmissiblePolicy S) := by
  sorry

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∀ (S : SemiMarkovDecisionProcess), DynamicProgrammingResults S

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  intro S
  sorry

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse