import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ProteinStructurePackage where
  bindingSiteGeometry : String
  activeSiteResidues : List ℕ
  bindingPocketVolume : ℝ
  hydrogenBondCount : ℕ
  hydrophobicInteractions : ℕ

structure ProteinStructureEvidence (P : ProteinStructurePackage) where
  bindingSiteGeometryClosed : P.bindingSiteGeometry ≠ ""
  activeSiteResiduesClosed : P.activeSiteResidues ≠ []
  bindingPocketVolumeClosed : P.bindingPocketVolume > 0
  hydrogenBondCountClosed : P.hydrogenBondCount ≥ 0
  hydrophobicInteractionsClosed : P.hydrophobicInteractions ≥ 0

def ProteinStructureClosed (P : ProteinStructurePackage) : Prop :=
  P.bindingSiteGeometry ≠ "" ∧ P.activeSiteResidues ≠ [] ∧
  P.bindingPocketVolume > 0 ∧ P.hydrogenBondCount ≥ 0 ∧ P.hydrophobicInteractions ≥ 0

theorem protein_structure_closed_from_evidence (P : ProteinStructurePackage) (E : ProteinStructureEvidence P) :
  ProteinStructureClosed P :=
by
  exact And.intro E.bindingSiteGeometryClosed
    (And.intro E.activeSiteResiduesClosed
      (And.intro E.bindingPocketVolumeClosed
        (And.intro E.hydrogenBondCountClosed E.hydrophobicInteractionsClosed)))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse