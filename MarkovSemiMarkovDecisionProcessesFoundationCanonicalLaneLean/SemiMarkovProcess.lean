import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure SemiMarkovProcess (A : AdmissibleClass) where
  stateSpace : Type u
  sojournDistribution : stateSpace → ℝ → ℝ
  kernel : stateSpace → stateSpace → ℝ → ℝ
  hazardRate : stateSpace → stateSpace → ℝ

structure SemiMarkovProcessEvidence (A : AdmissibleClass) (P : SemiMarkovProcess A) where
  sojournNonnegative : ∀ s t, P.sojournDistribution s t ≥ 0
  kernelNormalized : ∀ s t, (∫' τ, P.kernel s t τ) = 1

def SemiMarkovProcessClosed (P : SemiMarkovProcess A) : Prop :=
  ∀ s t, P.sojournDistribution s t ≥ 0

theorem semi_markov_process_closed_from_evidence (A : AdmissibleClass) (P : SemiMarkovProcess A) (E : SemiMarkovProcessEvidence A P) : SemiMarkovProcessClosed P :=
  by
    intro s t
    exact E.sojournNonnegative s t

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse