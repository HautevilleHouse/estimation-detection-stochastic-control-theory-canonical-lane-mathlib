import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure DetectionTheoryEvidence where
  likelihoodRatio : Prop
  neymanPearsonLemma : Prop
  rocCurve : Prop
  bayesRisk : Prop

structure DetectionEvidence (D : DetectionTheoryEvidence) where
  likelihoodRatioClosed : D.likelihoodRatio
  neymanPearsonLemmaClosed : D.neymanPearsonLemma
  rocCurveClosed : D.rocCurve
  bayesRiskClosed : D.bayesRisk

def DetectionClosed (D : DetectionTheoryEvidence) : Prop :=
  D.likelihoodRatio ∧ D.neymanPearsonLemma ∧ D.rocCurve ∧ D.bayesRisk

theorem detection_closed_from_evidence (D : DetectionTheoryEvidence) (E : DetectionEvidence D) :
    DetectionClosed D := by
  exact And.intro E.likelihoodRatioClosed
    (And.intro E.neymanPearsonLemmaClosed
      (And.intro E.rocCurveClosed E.bayesRiskClosed))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse