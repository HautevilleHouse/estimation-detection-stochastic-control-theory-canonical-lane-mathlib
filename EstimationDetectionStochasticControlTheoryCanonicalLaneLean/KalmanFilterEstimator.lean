import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure KalmanFilterEstimatorPackage where
  stateSpaceModel : Type u
  observationModel : Type v
  processNoise : Type w
  measurementNoise : Type x
  innovationProcess : Type y
  filterGain : Type z
  stateEstimate : Type a
  errorCovariance : Type b
  initialEstimate : Prop
  predictionUpdate : Prop
  innovationUpdate : Prop
  gainComputation : Prop
  consistencyCondition : Prop

structure KalmanFilterEstimatorEvidence (K : KalmanFilterEstimatorPackage) where
  initialEstimateClosed : K.initialEstimate
  predictionUpdateClosed : K.predictionUpdate
  innovationUpdateClosed : K.innovationUpdate
  gainComputationClosed : K.gainComputation
  consistencyConditionClosed : K.consistencyCondition

def KalmanFilterEstimatorClosed (K : KalmanFilterEstimatorPackage) : Prop :=
  K.initialEstimate ∧ K.predictionUpdate ∧ K.innovationUpdate ∧
  K.gainComputation ∧ K.consistencyCondition

theorem kalman_filter_estimator_closed_from_evidence
    (K : KalmanFilterEstimatorPackage) (E : KalmanFilterEstimatorEvidence K) :
    KalmanFilterEstimatorClosed K := by
  exact And.intro E.initialEstimateClosed
    (And.intro E.predictionUpdateClosed
      (And.intro E.innovationUpdateClosed
        (And.intro E.gainComputationClosed E.consistencyConditionClosed)))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
