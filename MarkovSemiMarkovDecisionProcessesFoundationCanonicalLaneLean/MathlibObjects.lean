import Mathlib

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure AdmittedObject where
  stateSpace : Type u
  actionSpace : Type v
  timeDomain : Type w
  transitionStructure : Prop
  rewardStructure : Prop
  conclusion : Prop

structure MarkovSemiMarkovDecisionProcessesEndgameState where
  object : AdmittedObject

def MarkovSemiMarkovDecisionProcessesWitnessClosed (O : AdmittedObject) : Prop :=
  O.conclusion

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse
