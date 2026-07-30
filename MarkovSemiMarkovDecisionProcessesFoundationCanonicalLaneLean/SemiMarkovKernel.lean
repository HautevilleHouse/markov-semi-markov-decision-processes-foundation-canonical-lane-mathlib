import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure SemiMarkovKernelPackage where
  stateSpace : Type
  actionSpace : Type
  sojournDistribution : Type
  transitionKernel : Type
  isSemiMarkov : Prop
  isMeasurable : Prop
  consistency : Prop

structure SemiMarkovKernelEvidence (S : SemiMarkovKernelPackage) where
  isSemiMarkovClosed : S.isSemiMarkov
  isMeasurableClosed : S.isMeasurable
  consistencyClosed : S.consistency

def SemiMarkovKernelClosed (S : SemiMarkovKernelPackage) : Prop :=
  S.isSemiMarkov ∧ S.isMeasurable ∧ S.consistency

theorem semi_markov_kernel_closed_from_evidence
    (S : SemiMarkovKernelPackage) (E : SemiMarkovKernelEvidence S) :
    SemiMarkovKernelClosed S := by
  exact And.intro E.isSemiMarkovClosed (And.intro E.isMeasurableClosed E.consistencyClosed)

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse