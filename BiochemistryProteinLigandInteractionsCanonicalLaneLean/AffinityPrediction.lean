import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure AffinityPredictionPackage where
  predictedKd : ℝ
  scoringFunction : String
  trainingDataset : List (ℝ × ℝ)
  correlationCoefficient : ℝ
  rootMeanSquareError : ℝ

structure AffinityPredictionEvidence (A : AffinityPredictionPackage) where
  predictedKdClosed : A.predictedKd > 0
  scoringFunctionClosed : A.scoringFunction ≠ ""
  trainingDatasetClosed : A.trainingDataset ≠ []
  correlationCoefficientClosed : A.correlationCoefficient > 0.5
  rootMeanSquareErrorClosed : A.rootMeanSquareError < 2.0

def AffinityPredictionClosed (A : AffinityPredictionPackage) : Prop :=
  A.predictedKd > 0 ∧ A.scoringFunction ≠ "" ∧ A.trainingDataset ≠ [] ∧
  A.correlationCoefficient > 0.5 ∧ A.rootMeanSquareError < 2.0

theorem affinity_prediction_closed_from_evidence (A : AffinityPredictionPackage) (E : AffinityPredictionEvidence A) :
  AffinityPredictionClosed A :=
by
  exact And.intro E.predictedKdClosed
    (And.intro E.scoringFunctionClosed
      (And.intro E.trainingDatasetClosed
        (And.intro E.correlationCoefficientClosed E.rootMeanSquareErrorClosed)))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse