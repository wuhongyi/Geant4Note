<!-- G4NuclearLevelData.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:46:48 2018 (+0800)
;; Last-Updated: 六 9月  1 12:52:58 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4NuclearLevelData

**静态类**

Nuclear level data uploaded at initialisation of Geant4 from data files of the G4LEVELGAMMADATA

- G4DeexPrecoParameters
- G4LevelReader
- G4ShellCorrection
- G4PairingCorrection


## class

```cpp
private:

  G4NuclearLevelData();

  static G4NuclearLevelData* theInstance;

public:

  static G4NuclearLevelData* GetInstance();

  ~G4NuclearLevelData();

  // run time call to access or to create level manager
  const G4LevelManager* GetLevelManager(G4int Z, G4int A);

  // add private data to isotope from master thread
  G4bool AddPrivateData(G4int Z, G4int A, const G4String& filename);

  // access to min/max A in the level DB 
  G4int GetMinA(G4int Z) const;
  G4int GetMaxA(G4int Z) const;

  // check max energy of a level without upload of the data
  G4double GetMaxLevelEnergy(G4int Z, G4int A) const;
  G4float MaxLevelEnergy(G4int Z, G4int A) const;

  // check closest level if the energy is below the max level energy
  G4double GetLevelEnergy(G4int Z, G4int A, G4double energy);

  // check closest level below given energy 
  G4double GetLowEdgeLevelEnergy(G4int Z, G4int A, G4double energy);

  // check if residual excitation energy corresponding to
  // discrete level and if it is the case select closest level
  G4double FindLevel(G4int Z, G4int A, G4double resMass, G4double Mass,
                     G4double partMass, G4double T);

  // access to all model parameters
  G4DeexPrecoParameters* GetParameters();
  G4PairingCorrection* GetPairingCorrection();
  G4ShellCorrection* GetShellCorrection();  

  // stream only existing levels
  void StreamLevels(std::ostream& os, G4int Z, G4int A) const;

  G4NuclearLevelData(G4NuclearLevelData &) = delete;
  G4NuclearLevelData & operator=(const G4NuclearLevelData &right) = delete;

private:

  void InitialiseForIsotope(G4int Z, G4int A);

  G4DeexPrecoParameters* fDeexPrecoParameters;
  G4LevelReader*         fLevelReader;
  G4PairingCorrection*   fPairingCorrection;
  G4ShellCorrection*     fShellCorrection;

  static const G4int ZMAX = 118;
  static const G4int AMIN[ZMAX];
  static const G4int AMAX[ZMAX];
  static const G4int LEVELIDX[ZMAX];

  std::vector<const G4LevelManager*> fLevelManagers[ZMAX];
  std::vector<G4bool> fLevelManagerFlags[ZMAX];

#ifdef G4MULTITHREADED
  static G4Mutex nuclearLevelDataMutex;
#endif
```

<!-- G4NuclearLevelData.md ends here -->
