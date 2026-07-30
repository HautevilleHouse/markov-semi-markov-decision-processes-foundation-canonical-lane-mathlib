import canonicalLaneMathlib.SemiMarkovKernel

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure OptimalPolicyPackage {S : SemiMarkovKernelPackage} (K : S) where
  policy : Type
  expectedReward : Type
  optimalityCriterion : Prop
  stationary : Prop
  uniqueness : Prop

structure OptimalPolicyEvidence {S : SemiMarkovKernelPackage} {K : S} (O : OptimalPolicyPackage K) where
  optimalityCriterionClosed : O.optimalityCriterion
  stationaryClosed : O.stationary
  uniquenessClosed : O.uniqueness

def OptimalPolicyClosed {S : SemiMarkovKernelPackage} {K : S} (O : OptimalPolicyPackage K) : Prop :=
  O.optimalityCriterion ∧ O.stationary ∧ O.uniqueness

theorem optimal_policy_closed_from_evidence
    {S : SemiMarkovKernelPackage} {K : S} (O : OptimalPolicyPackage K)
    (E : OptimalPolicyEvidence O) : OptimalPolicyClosed O := by
  exact And.intro E.optimalityCriterionClosed (And.intro E.stationaryClosed E.uniquenessClosed)

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse