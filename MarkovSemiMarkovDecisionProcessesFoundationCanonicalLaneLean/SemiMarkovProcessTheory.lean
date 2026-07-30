import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.DecisionProcessCore

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure SemiMarkovProcessTheory (S : SemiMarkovDecisionProcess) where
  sojournDistribution : S.stateSpace → S.actionSpace → ℝ → ℝ
  transitionProbabilities : S.stateSpace → S.actionSpace → S.stateSpace → ℝ
  embeddedMarkovChain : MarkovDecisionProcess S
  sojournTimes : S.stateSpace → S.actionSpace → ℝ
  sojournDistributionsAreDistributions : ∀ s a, (∫ t, sojournDistribution s a t) = 1
  sojournDistributionNonnegative : ∀ s a t, sojournDistribution s a t ≥ 0
  transitionProbabilitiesSumToOne : ∀ s a, ∑ s', transitionProbabilities s a s' = 1

theorem sojournTimeExpectationExists (S : SemiMarkovDecisionProcess) (th : SemiMarkovProcessTheory S) :
  ∀ s a, ∃ μ : ℝ, μ = ∫ t, t * th.sojournDistribution s a t := by
  sorry

theorem transitionKernelConsistency (S : SemiMarkovDecisionProcess) (th : SemiMarkovProcessTheory S) :
  ∀ s a s' t, S.transitionKernel s a s' t = th.transitionProbabilities s a s' * th.sojournDistribution s a t := by
  sorry

theorem semiMarkovProperty (S : SemiMarkovDecisionProcess) (th : SemiMarkovProcessTheory S) :
  ∀ s s' a t, (∀ u ≤ t, S.transitionKernel s a s' u = 0) → 
    (∀ u > t, S.transitionKernel s a s' u = th.transitionProbabilities s a s') := by
  sorry

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse