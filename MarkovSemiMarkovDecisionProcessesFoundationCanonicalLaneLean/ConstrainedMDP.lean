import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure ConstrainedMDP (A : AdmissibleClass) where
  stateSpace : Type u
  actionSpace : Type v
  transition : stateSpace → actionSpace → stateSpace → Prop
  reward : stateSpace → actionSpace → ℝ
  constraint : stateSpace → actionSpace → Prop

structure ConstrainedMDPEvidence (A : AdmissibleClass) (M : ConstrainedMDP A) where
  transitionClosed : ∀ s a s', M.transition s a s' → M.constraint s a
  rewardFinite : ∀ s a, M.reward s a ≠ ∞

def ConstrainedMDPClosed (M : ConstrainedMDP A) : Prop :=
  ∀ s a s', M.transition s a s' → M.constraint s a

theorem constrained_mdp_closed_from_evidence (A : AdmissibleClass) (M : ConstrainedMDP A) (E : ConstrainedMDPEvidence A M) : ConstrainedMDPClosed M :=
  by
    intro s a s' h
    exact E.transitionClosed s a s' h

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse