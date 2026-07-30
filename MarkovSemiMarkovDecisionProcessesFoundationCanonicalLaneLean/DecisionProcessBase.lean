import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure StateSpace (α : Type u) where
  carrier : Set α
  countablyGenerated : Prop

structure ActionSpace (β : Type v) where
  carrier : Set β
  borel : Prop

structure TransitionKernel (S : Type u) (A : Type v) where
  kernel : S → A → Measure S
  measurability : Prop

structure RewardFunction (S : Type u) (A : Type v) where
  reward : S → A → ℝ
  bounded : Prop

structure Policy (S : Type u) (A : Type v) where
  decision : S → Measure A
  measurability : Prop

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse