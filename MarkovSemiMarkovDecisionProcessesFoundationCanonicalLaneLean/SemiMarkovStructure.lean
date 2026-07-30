import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure SemiMarkovStructurePackage (S : Type u) (A : Type v) where
  holdingTimeDistribution : S -> S -> Type w
  transitionProbability : S -> A -> S -> Prop
  conditionalIndependence : Prop
  distributionConsistency : Prop

structure SemiMarkovStructureEvidence {S : Type u} {A : Type v}
    (P : SemiMarkovStructurePackage S A) where
  conditionalIndependenceClosed : P.conditionalIndependence
  distributionConsistencyClosed : P.distributionConsistency

def SemiMarkovStructureClosed {S : Type u} {A : Type v}
    (P : SemiMarkovStructurePackage S A) : Prop :=
  P.conditionalIndependence ∧ P.distributionConsistency

theorem semi_markov_structure_closed_from_evidence
    {S : Type u} {A : Type v} (P : SemiMarkovStructurePackage S A)
    (E : SemiMarkovStructureEvidence P) : SemiMarkovStructureClosed P := by
  exact And.intro E.conditionalIndependenceClosed E.distributionConsistencyClosed

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse
