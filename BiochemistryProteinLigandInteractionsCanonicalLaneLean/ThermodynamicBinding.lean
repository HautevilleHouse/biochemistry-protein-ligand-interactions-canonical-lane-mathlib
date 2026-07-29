import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ThermodynamicBindingPackage where
  gibbsFreeEnergy : Prop
  enthalpyChange : Prop
  entropyChange : Prop
  positiveBinding : Prop

structure ThermodynamicBindingEvidence (T : ThermodynamicBindingPackage) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  enthalpyChangeClosed : T.enthalpyChange
  entropyChangeClosed : T.entropyChange
  positiveBindingClosed : T.positiveBinding

def ThermodynamicBindingClosed (T : ThermodynamicBindingPackage) : Prop :=
  T.gibbsFreeEnergy ∧ T.enthalpyChange ∧ T.entropyChange ∧ T.positiveBinding

theorem thermodynamic_binding_closed_from_evidence (T : ThermodynamicBindingPackage)
    (E : ThermodynamicBindingEvidence T) : ThermodynamicBindingClosed T := by
  exact And.intro E.gibbsFreeEnergyClosed (And.intro E.enthalpyChangeClosed
    (And.intro E.entropyChangeClosed E.positiveBindingClosed))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse