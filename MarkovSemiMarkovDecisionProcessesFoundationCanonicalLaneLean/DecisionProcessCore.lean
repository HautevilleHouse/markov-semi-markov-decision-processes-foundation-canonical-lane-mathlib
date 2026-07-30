import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure SemiMarkovDecisionProcess where
  stateSpace : Type u
  actionSpace : Type v
  sojournTimeDistribution : stateSpace → actionSpace → ℝ → ℝ
  transitionKernel : stateSpace → actionSpace → stateSpace → ℝ → ℝ
  rewardRate : stateSpace → actionSpace → ℝ
  discountRate : ℝ
  stateSpaceNonempty : Nonempty stateSpace
  actionSpaceNonempty (s : stateSpace) : Nonempty (actionSpace)
  rewardBounded : ∃ M, ∀ s a, |rewardRate s a| ≤ M
  discountPositive : discountRate > 0

structure MarkovDecisionProcess (S : SemiMarkovDecisionProcess) where
  exponentialSojourn : ∀ s a t, S.sojournTimeDistribution s a t = S.transitionKernel s a s t
  memorylessProperty : ∀ s a t u, S.sojournTimeDistribution s a (t + u) = S.sojournTimeDistribution s a t * S.sojournTimeDistribution s a u

structure AdmissiblePolicy (S : SemiMarkovDecisionProcess) where
  stateActionFunction : S.stateSpace → S.actionSpace
  measurable : Measurable (fun (s : S.stateSpace) => stateActionFunction s)

structure OptimalityCriterion (S : SemiMarkovDecisionProcess) where
  valueFunction : S.stateSpace → ℝ
  optimalityCondition : ∀ (s : S.stateSpace), valueFunction s = 
    max (fun (a : S.actionSpace) => S.rewardRate s a + S.discountRate * 
      (∫ t, (S.transitionKernel s a s t) * (valueFunction s) dt))

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse