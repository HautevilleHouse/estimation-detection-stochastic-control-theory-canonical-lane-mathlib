import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure KalmanFilterBridge where
  stateEstimate : Prop
  errorCovariance : Prop
  innovationProcess : Prop
  optimalGain : Prop

structure KalmanFilterEvidence (B : KalmanFilterBridge) where
  stateEstimateClosed : B.stateEstimate
  errorCovarianceClosed : B.errorCovariance
  innovationProcessClosed : B.innovationProcess
  optimalGainClosed : B.optimalGain

def KalmanFilterClosed (B : KalmanFilterBridge) : Prop :=
  B.stateEstimate ∧ B.errorCovariance ∧ B.innovationProcess ∧ B.optimalGain

theorem kalman_filter_closed_from_evidence (B : KalmanFilterBridge) (E : KalmanFilterEvidence B) :
    KalmanFilterClosed B := by
  exact And.intro E.stateEstimateClosed
    (And.intro E.errorCovarianceClosed
      (And.intro E.innovationProcessClosed E.optimalGainClosed))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse