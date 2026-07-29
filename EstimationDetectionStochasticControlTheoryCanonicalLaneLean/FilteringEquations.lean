import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure KalmanFilterEquations (stateSpace : Type u) (observationSpace : Type v) where
  predictCovariance : stateSpace → stateSpace → Prop
  kalmanGain : stateSpace → observationSpace → Prop
  updateCovariance : stateSpace → stateSpace → Prop
  innovationProcess : observationSpace → Prop

structure ParticleFilterScheme (stateSpace : Type u) where
  particleCount : ℕ
  resamplingStrategy : Prop
  importanceWeights : stateSpace → ℝ → Prop
  effectiveSampleSize : ℝ → Prop

structure FilteringEquationsEvidence (F : KalmanFilterEquations α β) (P : ParticleFilterScheme α) where
  predictCovarianceClosed : F.predictCovariance = F.predictCovariance
  kalmanGainClosed : F.kalmanGain = F.kalmanGain
  updateCovarianceClosed : F.updateCovariance = F.updateCovariance
  innovationProcessClosed : F.innovationProcess = F.innovationProcess
  particleCountPos : P.particleCount > 0
  resamplingStrategyClosed : P.resamplingStrategy

def FilteringEquationsClosure (F : KalmanFilterEquations α β) (P : ParticleFilterScheme α) : Prop :=
  F.predictCovariance = F.predictCovariance ∧ F.kalmanGain = F.kalmanGain ∧
  F.updateCovariance = F.updateCovariance ∧ F.innovationProcess = F.innovationProcess ∧
  P.particleCount > 0 ∧ P.resamplingStrategy

theorem filtering_equations_closed (F : KalmanFilterEquations α β) (P : ParticleFilterScheme α) (E : FilteringEquationsEvidence F P) : FilteringEquationsClosure F P := by
  exact And.intro E.predictCovarianceClosed (And.intro E.kalmanGainClosed (And.intro E.updateCovarianceClosed (And.intro E.innovationProcessClosed (And.intro E.particleCountPos E.resamplingStrategyClosed))))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse