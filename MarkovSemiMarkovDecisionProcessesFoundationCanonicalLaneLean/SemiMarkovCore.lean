import MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.DecisionProcessBase

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure SemiMarkovKernel (S : Type u) (A : Type v) extends TransitionKernel S A where
  holdingTime : S → A → Measure ℝ≥0
  measurabilityHolding : Prop

structure SemiMarkovReward (S : Type u) (A : Type v) extends RewardFunction S A where
  cumulativeCost : S → A → ℝ → ℝ
  measurabilityCumulative : Prop

structure SemiMarkovDecisionProcess (S : Type u) (A : Type v) where
  stateSpace : StateSpace S
  actionSpace : ActionSpace A
  kernel : SemiMarkovKernel S A
  reward : SemiMarkovReward S A
  horizon : ℝ≥0∞

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse