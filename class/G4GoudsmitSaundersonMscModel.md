<!-- G4GoudsmitSaundersonMscModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 06:59:07 2018 (+0800)
;; Last-Updated: 日 7月 15 07:02:38 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4GoudsmitSaundersonMscModel

**public G4VMscModel**

Kawrakow-Bielajew Goudsmit-Saunderson MSC model based on the screened Rutherford DCS for elastic scattering of e-/e+. Option, to include (Mott) correction (see above), is also available now (SetOptionMottCorrection(true)). An EGSnrc like error-free stepping algorithm (UseSafety) is available beyond the usual Geant4 step limitation algorithms and true to geomerty and geometry to true step length computations that were adopted from the Urban model[5]. The most accurate setting: error-free stepping (UseSafety) with Mott-correction (SetOptionMottCorrection(true)).


## class

```cpp
public:

  G4GoudsmitSaundersonMscModel(const G4String& nam = "GoudsmitSaunderson");

  virtual ~G4GoudsmitSaundersonMscModel();

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&);

  virtual void InitialiseLocal(const G4ParticleDefinition* p, G4VEmModel* masterModel);


  virtual G4ThreeVector& SampleScattering(const G4ThreeVector&, G4double safety);

  virtual G4double ComputeTruePathLengthLimit(const G4Track& track, G4double& currentMinimalStep);

  virtual G4double ComputeGeomPathLength(G4double truePathLength);

  virtual G4double ComputeTrueStepLength(G4double geomStepLength);

  void     StartTracking(G4Track*);

  void     SampleMSC();

  G4double GetTransportMeanFreePath(const G4ParticleDefinition*, G4double);

  void SetOptionPWACorrection(G4bool opt)    { fIsUsePWACorrection = opt; }

  G4bool GetOptionPWACorrection() const      { return fIsUsePWACorrection; }

  void   SetOptionMottCorrection(G4bool opt) { fIsUseMottCorrection = opt; }

  G4bool GetOptionMottCorrection() const     { return fIsUseMottCorrection; }

  G4GoudsmitSaundersonTable* GetGSTable()          { return fGSTable; }

  G4GSPWACorrections*        GetPWACorrection()    { return fPWACorrection; }

private:
  inline void     SetParticle(const G4ParticleDefinition* p);

  inline G4double GetLambda(G4double);

  //  hide assignment operator
  G4GoudsmitSaundersonMscModel & operator=(const  G4GoudsmitSaundersonMscModel &right);
  G4GoudsmitSaundersonMscModel(const  G4GoudsmitSaundersonMscModel&);
  G4double GetTransportMeanFreePathOnly(const G4ParticleDefinition*,G4double);

  inline G4double Randomizetlimit();
```

<!-- G4GoudsmitSaundersonMscModel.md ends here -->
