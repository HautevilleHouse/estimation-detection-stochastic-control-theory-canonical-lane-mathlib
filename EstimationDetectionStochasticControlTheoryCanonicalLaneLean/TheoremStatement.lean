import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EstimationDetectionStochasticControlTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure EstimationDetectionAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  stateSpace : Type
  observationSpace : Type
  controlSpace : Type
  stochasticModel : Prop
  estimationCriterion : Prop
  detectionCriterion : Prop
  controlObjective : Prop
  conclusion : Prop

def EstimationDetectionWitnessClosed (O : EstimationDetectionAdmittedObject) : Prop :=
  O.conclusion

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  certificateLane : String
  carriedRemainder : String
  deriving Repr, DecidableEq

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse