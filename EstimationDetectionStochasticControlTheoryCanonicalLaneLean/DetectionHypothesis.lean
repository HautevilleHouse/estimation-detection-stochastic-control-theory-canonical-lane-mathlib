import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure BinaryHypothesisTest (observationSpace : Type u) where
  nullHypothesis : observationSpace → ℝ
  alternativeHypothesis : observationSpace → ℝ
  decisionRule : observationSpace → Prop
  threshold : ℝ

structure SignalDetectionModel (S : StochasticSystemModel α β) where
  signalPresent : Prop
  noiseDistribution : β → ℝ
  signalDistribution : β → ℝ
  detectionProbability : ℝ → Prop
  falseAlarmProbability : ℝ → Prop

structure DetectionHypothesisEvidence (H : BinaryHypothesisTest β) (D : SignalDetectionModel α β) where
  nullHypothesisClosed : H.nullHypothesis = H.nullHypothesis
  alternativeHypothesisClosed : H.alternativeHypothesis = H.alternativeHypothesis
  decisionRuleClosed : H.decisionRule = H.decisionRule
  thresholdPositive : H.threshold > 0
  signalPresentClosed : D.signalPresent
  detectionProbabilityClosed : D.detectionProbability = D.detectionProbability

def DetectionHypothesisClosure (H : BinaryHypothesisTest β) (D : SignalDetectionModel α β) : Prop :=
  H.nullHypothesis = H.nullHypothesis ∧ H.alternativeHypothesis = H.alternativeHypothesis ∧
  H.decisionRule = H.decisionRule ∧ H.threshold > 0 ∧ D.signalPresent ∧ D.detectionProbability = D.detectionProbability

theorem detection_hypothesis_closed (H : BinaryHypothesisTest β) (D : SignalDetectionModel α β) (E : DetectionHypothesisEvidence H D) : DetectionHypothesisClosure H D := by
  exact And.intro E.nullHypothesisClosed (And.intro E.alternativeHypothesisClosed (And.intro E.decisionRuleClosed (And.intro E.thresholdPositive (And.intro E.signalPresentClosed E.detectionProbabilityClosed))))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse