import HautevilleHouse.MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure StateSpacePackage where
  finiteOrCountable : Prop
  measurableStructure : Prop
  initialDistribution : Prop

structure StateSpaceEvidence (S : StateSpacePackage) where
  finiteOrCountableClosed : S.finiteOrCountable
  measurableStructureClosed : S.measurableStructure
  initialDistributionClosed : S.initialDistribution

def StateSpaceClosed (S : StateSpacePackage) : Prop :=
  S.finiteOrCountable ∧ S.measurableStructure ∧ S.initialDistribution

theorem state_space_closed_from_evidence (S : StateSpacePackage) (E : StateSpaceEvidence S) :
    StateSpaceClosed S :=
  And.intro E.finiteOrCountableClosed (And.intro E.measurableStructureClosed E.initialDistributionClosed)

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse
