import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean

structure OptimalityCriteriaPackage (S : Type u) (A : Type v) where
  valueFunction : S -> Type w
  policySpace : Type u
  optimalityEquation : Prop
  existenceOptimalPolicy : Prop
  uniquenessConditions : Prop

structure OptimalityCriteriaEvidence {S : Type u} {A : Type v}
    (O : OptimalityCriteriaPackage S A) where
  optimalityEquationClosed : O.optimalityEquation
  existenceOptimalPolicyClosed : O.existenceOptimalPolicy
  uniquenessConditionsClosed : O.uniquenessConditions

def OptimalityCriteriaClosed {S : Type u} {A : Type v}
    (O : OptimalityCriteriaPackage S A) : Prop :=
  O.optimalityEquation ∧ O.existenceOptimalPolicy ∧ O.uniquenessConditions

theorem optimality_criteria_closed_from_evidence
    {S : Type u} {A : Type v} (O : OptimalityCriteriaPackage S A)
    (E : OptimalityCriteriaEvidence O) : OptimalityCriteriaClosed O := by
  exact And.intro E.optimalityEquationClosed
    (And.intro E.existenceOptimalPolicyClosed E.uniquenessConditionsClosed)

end MarkovSemiMarkovDecisionProcessesFoundationCanonicalLaneLean
end HautevilleHouse
