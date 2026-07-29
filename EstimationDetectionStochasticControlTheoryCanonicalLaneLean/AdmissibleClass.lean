import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure AdmissibleClass where
  object : EstimationControlAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure EstimationControlAdmittedObject where
  systemModel : StochasticSystemModel Unit Unit
  filterModel : EstimationModel systemModel
  detectionModel : SignalDetectionModel Unit Unit
  controlProblem : OptimalControlProblem systemModel (ControlPolicy Unit Unit) Unit
  conclusion : bridgeClosed (AdmissibleClass.mk this True True (Or.inl True))

def admittedClosure (A : AdmissibleClass) : Prop :=
  ConstrainedEstimationDetectionStochasticControlClosure A

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse