import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure DetectionHypothesisTestingPackage where
  hypothesisSpace : Type u
  observationSpace : Type v
  decisionRule : Type w
  likelihoodRatio : Type x
  threshold : Type y
  detectionProbability : Prop
  falseAlarmProbability : Prop
  neymanPearsonLemma : Prop
  bayesOptimalDecision : Prop

structure DetectionHypothesisTestingEvidence (D : DetectionHypothesisTestingPackage) where
  detectionProbabilityClosed : D.detectionProbability
  falseAlarmProbabilityClosed : D.falseAlarmProbability
  neymanPearsonLemmaClosed : D.neymanPearsonLemma
  bayesOptimalDecisionClosed : D.bayesOptimalDecision

def DetectionHypothesisTestingClosed (D : DetectionHypothesisTestingPackage) : Prop :=
  D.detectionProbability ∧ D.falseAlarmProbability ∧
  D.neymanPearsonLemma ∧ D.bayesOptimalDecision

theorem detection_hypothesis_testing_closed_from_evidence
    (D : DetectionHypothesisTestingPackage) (E : DetectionHypothesisTestingEvidence D) :
    DetectionHypothesisTestingClosed D := by
  exact And.intro E.detectionProbabilityClosed
    (And.intro E.falseAlarmProbabilityClosed
      (And.intro E.neymanPearsonLemmaClosed E.bayesOptimalDecisionClosed))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
