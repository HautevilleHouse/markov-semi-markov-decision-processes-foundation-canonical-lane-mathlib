import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.DecisionProcessCore

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure OptimalControlResults (S : SemiMarkovDecisionProcess) where
  optimalValueFunction : S.stateSpace → ℝ
  optimalPolicy : AdmissiblePolicy S
  optimalityCondition : ∀ s, optimalValueFunction s = 
    S.rewardRate s (optimalPolicy.stateActionFunction s) + 
    S.discountRate * (∫ t, (S.transitionKernel s (optimalPolicy.stateActionFunction s) s t) * (optimalValueFunction s) dt)
  uniqueness : ∀ (V : S.stateSpace → ℝ), (∀ s, V s = 
    max (fun a => S.rewardRate s a + S.discountRate * (∫ t, (S.transitionKernel s a s t) * (V s) dt))) → V = optimalValueFunction

theorem optimalPolicyExists (S : SemiMarkovDecisionProcess) :
  Nonempty (OptimalControlResults S) := by
  sorry

theorem policyGradientTheorem (S : SemiMarkovDecisionProcess) (π : AdmissiblePolicy S) :
  ∀ s, ∂/∂π (value function) = ... := by
  sorry

theorem bellmanOptimalityCharacterization (S : SemiMarkovDecisionProcess) (oc : OptimalControlResults S) :
  ∀ s, oc.optimalValueFunction s = 
    max (fun a => S.rewardRate s a + S.discountRate * (∫ t, (S.transitionKernel s a s t) * (oc.optimalValueFunction s) dt)) := by
  sorry

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse