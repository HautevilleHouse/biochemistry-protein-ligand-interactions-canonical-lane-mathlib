import BiochemistryProteinLigandInteractionsCanonicalLaneLean.ThermodynamicProfiling

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure MolecularRecognitionPackage where
  complementarity : Prop
  shapeFit : Prop
  electrostaticMatch : Prop
  recognitionAchieved : Prop

structure MolecularRecognitionEvidence (M : MolecularRecognitionPackage) where
  complementarityClosed : M.complementarity
  shapeFitClosed : M.shapeFit
  electrostaticMatchClosed : M.electrostaticMatch
  recognitionFromComponents : M.complementarity ∧ M.shapeFit ∧ M.electrostaticMatch → M.recognitionAchieved

def MolecularRecognitionClosed (M : MolecularRecognitionPackage) : Prop :=
  M.recognitionAchieved

theorem molecular_recognition_closed_from_evidence (M : MolecularRecognitionPackage)
    (E : MolecularRecognitionEvidence M) : MolecularRecognitionClosed M := by
  apply E.recognitionFromComponents
  exact And.intro E.complementarityClosed (And.intro E.shapeFitClosed E.electrostaticMatchClosed)

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse