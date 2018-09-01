<!-- G4DeexPrecoParameters.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:42:28 2018 (+0800)
;; Last-Updated: 六 9月  1 12:46:29 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4DeexPrecoParameters

List of parameters of the pre-compound model and the deexcitation module

## class

```cpp
enum G4DeexChannelType
{
  fEvaporation = 0,
  fGEM,
  fCombined,
  fDummy
};
```

```cpp
public:

  explicit G4DeexPrecoParameters();

  ~G4DeexPrecoParameters();

  void SetDefaults();

  // printing
  std::ostream& StreamInfo(std::ostream& os) const;
  void Dump() const;
  friend std::ostream& operator<< (std::ostream& os, 
				   const G4DeexPrecoParameters&);

  // inline access methods 

  inline G4double GetLevelDensity() const;

  inline G4double GetR0() const;

  inline G4double GetTransitionsR0() const;

  inline G4double GetFermiEnergy() const;

  inline G4double GetPrecoLowEnergy() const;

  inline G4double GetPhenoFactor() const;

  inline G4double GetMinExcitation() const;

  inline G4double GetMaxLifeTime() const;

  inline G4double GetMinExPerNucleounForMF() const;

  inline G4int GetInternalConversionID() const;

  inline G4int GetMinZForPreco() const;

  inline G4int GetMinAForPreco() const;

  inline G4int GetPrecoModelType() const;

  inline G4int GetDeexModelType() const;

  inline G4int GetTwoJMAX() const;

  inline G4bool NeverGoBack() const;

  inline G4bool UseSoftCutoff() const;

  inline G4bool UseCEM() const;

  inline G4bool UseGNASH() const;

  inline G4bool UseHETC() const;

  inline G4bool UseAngularGen() const;

  inline G4bool PrecoDummy() const;

  inline G4bool CorrelatedGamma() const;

  inline G4bool GetInternalConversionFlag() const;

  inline G4bool StoreICLevelData() const;

  inline G4DeexChannelType GetDeexChannelsType() const;

  // Set methods 

  void SetLevelDensity(G4double);

  void SetR0(G4double);

  void SetTransitionsR0(G4double);

  void SetFermiEnergy(G4double);

  void SetPrecoLowEnergy(G4double);

  void SetPhenoFactor(G4double);

  void SetMinExcitation(G4double);

  void SetMaxLifeTime(G4double);

  void SetMinExPerNucleounForMF(G4double);

  void SetMinEForMultiFrag(G4double);

  void SetMinZForPreco(G4int);

  void SetMinAForPreco(G4int);

  void SetPrecoModelType(G4int);

  void SetDeexModelType(G4int);

  void SetTwoJMAX(G4int);

  void SetNeverGoBack(G4bool);

  void SetUseSoftCutoff(G4bool);

  void SetUseCEM(G4bool);

  void SetUseGNASH(G4bool);

  void SetUseHETC(G4bool);

  void SetUseAngularGen(G4bool);

  void SetPrecoDummy(G4bool);

  void SetCorrelatedGamma(G4bool);

  void SetStoreICLevelData(G4bool);

  // obsolete method (use previous)
  void SetStoreAllLevels(G4bool);

  void SetInternalConversionFlag(G4bool);

  void SetDeexChannelsType(G4DeexChannelType);

  // obsolete method (has no effect)
  inline void SetUseFilesNEW(G4bool) {};

private:

  G4bool IsLocked() const;

  G4DeexPrecoParameters(const G4DeexPrecoParameters & right) = delete;  
  const G4DeexPrecoParameters& operator=
  (const G4DeexPrecoParameters &right) = delete;
  G4bool operator==(const G4DeexPrecoParameters &right) const = delete;
  G4bool operator!=(const G4DeexPrecoParameters &right) const = delete;

  G4DeexParametersMessenger* theMessenger;
  G4StateManager* fStateManager;

  // Level density parameter
  G4double fLevelDensity;

  // Nuclear radius r0 
  G4double fR0;

  // Nuclear radius r0 for transitions
  G4double fTransitionsR0;

  // Fermi energy level
  G4double fFermiEnergy;

  // Low-energy excitation per nucleon limit 
  G4double fPrecoLowEnergy;

  // Preco phenomenological factor
  G4double fPhenoFactor;

  // Excitation handler
  G4double fMinExcitation;
  G4double fMaxLifeTime;

  // Multi-fragmentation model
  G4double fMinExPerNucleounForMF;

  // Cross section type
  G4int fPrecoType;
  G4int fDeexType;

  // Internal conversion model ID
  G4int fInternalConversionID;
  G4int fTwoJMAX;

  // Preco model
  G4int fMinZForPreco;
  G4int fMinAForPreco;

  // Preco flags
  G4bool fNeverGoBack;
  G4bool fUseSoftCutoff;
  G4bool fUseCEM;
  G4bool fUseGNASH;
  G4bool fUseHETC;
  G4bool fUseAngularGen;
  G4bool fPrecoDummy;

  // Deex flags
  G4bool fCorrelatedGamma;
  G4bool fStoreAllLevels;
  G4bool fInternalConversion;

  // type of a set of e-exitation channels
  G4DeexChannelType fDeexChannelType;   

#ifdef G4MULTITHREADED
  static G4Mutex deexPrecoMutex;
#endif
```


<!-- G4DeexPrecoParameters.md ends here -->
