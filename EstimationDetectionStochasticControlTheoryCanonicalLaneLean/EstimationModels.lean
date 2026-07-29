import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure StochasticSystemModel (stateSpace : Type u) (observationSpace : Type v) where
  stateTransition : stateSpace → stateSpace → Prop
  observationMap : stateSpace → observationSpace
  initialDistribution : stateSpace → ℝ
  noiseCharacteristics : Prop

structure EstimationModel (S : StochasticSystemModel α β) where
  filterType : Type w
  predictionStep : S.stateTransition → filterType → Prop
  updateStep : β → filterType → Prop
  consistency : Prop

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse