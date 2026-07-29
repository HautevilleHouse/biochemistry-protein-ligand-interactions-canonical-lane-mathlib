import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure BindingThermodynamicsPackage where
  enthalpyChange : Prop
  entropyChange : Prop
  gibbsFreeEnergyChange : Prop
  temperature : Prop
  bindingAffinity : Prop
  heatCapacityChange : Prop

structure BindingThermodynamicsEvidence (T : BindingThermodynamicsPackage) where
  enthalpyChangeClosed : T.enthalpyChange
  entropyChangeClosed : T.entropyChange
  gibbsFreeEnergyChangeClosed : T.gibbsFreeEnergyChange
  temperatureClosed : T.temperature
  bindingAffinityClosed : T.bindingAffinity
  heatCapacityChangeClosed : T.heatCapacityChange

def BindingThermodynamicsClosed (T : BindingThermodynamicsPackage) : Prop :=
  T.enthalpyChange ∧ T.entropyChange ∧ T.gibbsFreeEnergyChange ∧
  T.temperature ∧ T.bindingAffinity ∧ T.heatCapacityChange

theorem binding_thermodynamics_closed_from_evidence (T : BindingThermodynamicsPackage)
    (E : BindingThermodynamicsEvidence T) : BindingThermodynamicsClosed T :=
  And.intro E.enthalpyChangeClosed (And.intro E.entropyChangeClosed
    (And.intro E.gibbsFreeEnergyChangeClosed (And.intro E.temperatureClosed
      (And.intro E.bindingAffinityClosed E.heatCapacityChangeClosed))))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse