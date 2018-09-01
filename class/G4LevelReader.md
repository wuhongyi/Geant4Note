<!-- G4LevelReader.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:58:07 2018 (+0800)
;; Last-Updated: 六 9月  1 12:59:47 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4LevelReader

Helper class to read Geant4 nuclear level data


## class

```cpp
public:

  explicit G4LevelReader(G4NuclearLevelData*);

  // create run manager using G4LEVELGAMMADATA data for Z and A
  const G4LevelManager* CreateLevelManager(G4int Z, G4int A);

  // create run manager using whatever data
  const G4LevelManager* MakeLevelManager(G4int Z, G4int A,
					 const G4String& filename);

  inline void SetVerbose(G4int val);
  
private:

  G4bool ReadData(std::istringstream& dataFile, G4double& x);

  G4bool ReadDataItem(std::istream& dataFile, G4double& x);

  G4bool ReadDataItem(std::istream& dataFile, G4float& x);

  G4bool ReadDataItem(std::istream& dataFile, G4int& x);

  G4bool ReadDataItem(std::istream& dataFile, G4String& x);
  
  const std::vector<G4float>* NormalizedICCProbability(G4int Z);

  const G4LevelManager* LevelManager(G4int Z, G4int A, G4int nlev,
				     std::ifstream& infile);  

  G4LevelReader(const G4LevelReader & right) = delete;  
  const G4LevelReader& operator=(const G4LevelReader &right) = delete;
  G4bool operator==(const G4LevelReader &right) const = delete;
  G4bool operator!=(const G4LevelReader &right) const = delete;

  G4NuclearLevelData* fData;
  G4DeexPrecoParameters* fParam;

  G4double fEnergy;
  G4double fCurrEnergy;
  G4double fTrEnergy;

  G4double fTimeFactor;
  G4double fTime;

  G4float  fProb;
  G4float  fSpin;
  G4float  fAlpha;
  G4float  fAlphaMax;
  G4float  fRatio;
  G4float  fICC[10];

  static const G4int nfloting = 13;
  static G4String fFloatingLevels[nfloting];

  G4String fDirectory;
  G4String fFile;
  G4String fPol;

  static const G4int nbufmax = 20;
  static const G4int nbuf1   = 14;
  static const G4int nbuf2   = 8;

  char buffer[nbufmax];
  char buff1[nbuf1];
  char buff2[nbuf2];
  char bufp[3];

  G4int fVerbose;
  G4int fLevelMax;
  G4int fTransMax;

  G4float fNorm1;

  std::vector<G4double> vEnergy;
  std::vector<G4int>    vSpin;
  std::vector<const G4NucLevel*> vLevel;

  std::vector<G4int>    vTrans;
  std::vector<G4float>  vRatio;
  std::vector<G4float>  vGammaCumProbability;
  std::vector<G4float>  vGammaProbability;
  std::vector<const std::vector<G4float>*> vShellProbability;
```

<!-- G4LevelReader.md ends here -->
