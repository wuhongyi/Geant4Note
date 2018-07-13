<!-- G4EmParameters.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 09:07:40 2018 (+0800)
;; Last-Updated: 六 7月 14 02:50:37 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4EmParameters

```
The old interface class G4EmProcessOptions is still available but but is strongly recommended not to be used. 
```

A utility static class, responsable for keeping parameters for all EM physics processes and models.  
It is initialized by the master thread but can be updated at any moment. Parameters may be used in run time or at initialisation  


Options are available for steering of electromagnetic processes.   
These options may be invoked either by UI commands or by the new C++ interface class G4EmParameters.   
The interface G4EmParameters::Instance() is thread safe, EM parameters are shared between threads, and parameters are shared between all EM processes.   
Parameters may be modified at **G4State_PreInit** or **G4State_Idle states** of Geant4.  

```
Note, that when any of EM physics constructor is instantiated a default set of EM parameters for this EM physics configuration is defined. So, parameters modification should be applied only after. 
```

This class has the following public methods:

- Dump()
- StreamInfo(std::ostream&)
- SetDefaults()
- SetLossFluctuations(G4bool)
- SetBuildCSDARange(G4bool)
- SetLPM(G4bool)
- SetSpline(G4bool)
- SetUseCutAsFinalRange(G4bool)
- SetApplyCuts(G4bool)
- SetFluo(G4bool val)
- SetBeardenFluoDir(G4bool val)
- SetAuger(G4bool val)
- SetAugerCascade(G4bool val)
- SetPixe(G4bool val)
- SetDeexcitationIgnoreCut(G4bool val)
- SetLateralDisplacement(G4bool val)
- SetLateralDisplacementAlg96(G4bool val)
- SetMuHadLateralDisplacement(G4bool val)
- SetLatDisplacementBeyondBoundary(G4bool val)
- ActivateAngularGeneratorForIonisation(G4bool val)
- SetUseMottCorrection(G4bool val)
- SetIntegral(G4bool val)
- SetBirksActive(G4bool val)
- SetDNAFast(G4bool val)
- SetDNAStationary(G4bool val)
- SetDNAElectronMsc(G4bool val)
- SetEmSaturation(G4EmSaturation*)
- SetMinSubRange(G4double)
- SetMinEnergy(G4double)
- SetMaxEnergy(G4double)
- SetMaxEnergyForCSDARange(G4double)
- SetLowestEnergy(G4double)
- SetLowestMuHadEnergy(G4double)
- SetLowestTripletEnergy(G4double)
- SetLinearLossLimit(G4double)
- SetBremsstrahlungTh(G4double)
- SetLambdaFactor(G4double)
- SetFactorForAngleLimit(G4double)
- SetMscThetaLimit(G4double)
- SetMscRangeFactor(G4double)
- SetMscMuHadRangeFactor(G4double)
- SetMscGeomFactor(G4double)
- SetMscSkin(G4double)
- SetScreeningFactor(G4double)
- SetStepFunction(G4double, G4double)
- SetStepFunctionMuHad(G4double, G4double)
- SetNumberOfBins(G4int)
- SetNumberOfBinsPerDecade(G4int)
- SetVerbose(G4int)
- SetWorkerVerbose(G4int)
- SetMscStepLimitType(G4MscStepLimitType val)
- SetMscMuHadStepLimitType(G4MscStepLimitType val)
- SetNuclearFormFactorType(G4NuclearFormFactorType val)
- SetPIXECrossSectionModel(const G4String&)
- SetPIXEElectronCrossSectionModel(const G4String&)
- AddPAIModel(const G4String& particle, const G4String& region, const G4String& type)
- AddMicroElecModel(const G4String& region)
- AddDNA(const G4String& region, const G4String& type)
- AddMsc(const G4String& region, const G4String& physics_type)
- AddPhysics(const G4String& region, const G4String& physics_type)
- SetSubCutoff(G4bool, const G4String& region)
- SetDeexActiveRegion(const G4String& region, G4bool, G4bool, G4bool)
- SetProcessBiasingFactor(const G4String& process, G4double, G4bool)
- ActivateForcedInteraction(const G4String& process, const G4String& region, G4double, G4bool)
- ActivateSecondaryBiasing(const G4String& process, const G4String& region, G4double, G4double)


----

## class

```cpp
  static G4EmParameters* Instance();

  ~G4EmParameters();

  void SetDefaults();

  // printing
  std::ostream& StreamInfo(std::ostream& os) const;
  void Dump() const;
  friend std::ostream& operator<< (std::ostream& os, const G4EmParameters&);

  // boolean flags
  void SetLossFluctuations(G4bool val);
  G4bool LossFluctuation() const;

  void SetBuildCSDARange(G4bool val);
  G4bool BuildCSDARange() const;

  void SetLPM(G4bool val);
  G4bool LPM() const;

  void SetSpline(G4bool val);
  G4bool Spline() const;

  void SetUseCutAsFinalRange(G4bool val);
  G4bool UseCutAsFinalRange() const;

  void SetApplyCuts(G4bool val);
  G4bool ApplyCuts() const;

  void SetFluo(G4bool val);
  G4bool Fluo() const;

  void SetBeardenFluoDir(G4bool val);
  G4bool BeardenFluoDir() const;

  void SetAuger(G4bool val);
  G4bool Auger() const;

  void SetAugerCascade(G4bool val);
  G4bool AugerCascade() const;

  void SetPixe(G4bool val);
  G4bool Pixe() const;

  void SetDeexcitationIgnoreCut(G4bool val);
  G4bool DeexcitationIgnoreCut() const;

  void SetLateralDisplacement(G4bool val);
  G4bool LateralDisplacement() const;

  void SetLateralDisplacementAlg96(G4bool val);
  G4bool LateralDisplacementAlg96() const;

  void SetMuHadLateralDisplacement(G4bool val);
  G4bool MuHadLateralDisplacement() const;

  void SetLatDisplacementBeyondSafety(G4bool val);
  G4bool LatDisplacementBeyondSafety() const;

  void ActivateAngularGeneratorForIonisation(G4bool val);
  G4bool UseAngularGeneratorForIonisation() const;

  void SetUseMottCorrection(G4bool val);
  G4bool UseMottCorrection() const;

  void SetIntegral(G4bool val);
  G4bool Integral() const;

  void SetBirksActive(G4bool val);
  G4bool BirksActive() const;

  void SetDNAFast(G4bool val);
  G4bool DNAFast() const;

  void SetDNAStationary(G4bool val);
  G4bool DNAStationary() const;

  void SetDNAElectronMsc(G4bool val);
  G4bool DNAElectronMsc() const;

  void SetGammaSharkActive(G4bool val);
  G4bool GammaSharkActive() const;

  void SetEmSaturation(G4EmSaturation*);
  G4EmSaturation* GetEmSaturation();

  // double parameters with values
  void SetMinSubRange(G4double val);
  G4double MinSubRange() const;

  void SetMinEnergy(G4double val);
  G4double MinKinEnergy() const;

  void SetMaxEnergy(G4double val);
  G4double MaxKinEnergy() const;

  void SetMaxEnergyForCSDARange(G4double val);
  G4double MaxEnergyForCSDARange() const;

  void SetLowestElectronEnergy(G4double val);
  G4double LowestElectronEnergy() const;

  void SetLowestMuHadEnergy(G4double val);
  G4double LowestMuHadEnergy() const;

  void SetLowestTripletEnergy(G4double val);
  G4double LowestTripletEnergy() const;

  void SetLinearLossLimit(G4double val);
  G4double LinearLossLimit() const;

  void SetBremsstrahlungTh(G4double val);
  G4double BremsstrahlungTh() const;

  void SetLambdaFactor(G4double val);
  G4double LambdaFactor() const;

  void SetFactorForAngleLimit(G4double val);
  G4double FactorForAngleLimit() const;

  void SetMscThetaLimit(G4double val);
  G4double MscThetaLimit() const;

  void SetMscRangeFactor(G4double val);
  G4double MscRangeFactor() const;

  void SetMscMuHadRangeFactor(G4double val);
  G4double MscMuHadRangeFactor() const;

  void SetMscGeomFactor(G4double val);
  G4double MscGeomFactor() const;

  void SetMscSkin(G4double val);
  G4double MscSkin() const;

  void SetScreeningFactor(G4double val);
  G4double ScreeningFactor() const;

  void SetStepFunction(G4double v1, G4double v2);

  void SetStepFunctionMuHad(G4double v1, G4double v2);

  // integer parameters 
  void SetNumberOfBins(G4int val);
  G4int NumberOfBins() const;

  void SetNumberOfBinsPerDecade(G4int val);
  G4int NumberOfBinsPerDecade() const;

  void SetVerbose(G4int val);
  G4int Verbose() const;

  void SetWorkerVerbose(G4int val);
  G4int WorkerVerbose() const;

  void SetMscStepLimitType(G4MscStepLimitType val);
  G4MscStepLimitType MscStepLimitType() const;

  void SetMscMuHadStepLimitType(G4MscStepLimitType val);
  G4MscStepLimitType MscMuHadStepLimitType() const;

  void SetNuclearFormfactorType(G4NuclearFormfactorType val);
  G4NuclearFormfactorType NuclearFormfactorType() const;

  // string parameters 
  void SetPIXECrossSectionModel(const G4String&);
  const G4String& PIXECrossSectionModel();

  void SetPIXEElectronCrossSectionModel(const G4String&);
  const G4String& PIXEElectronCrossSectionModel();

  // parameters per region or per process 
  void AddPAIModel(const G4String& particle,
                   const G4String& region,
                   const G4String& type);
  const std::vector<G4String>& ParticlesPAI() const;
  const std::vector<G4String>& RegionsPAI() const;
  const std::vector<G4String>& TypesPAI() const;

  void AddMicroElec(const G4String& region);
  const std::vector<G4String>& RegionsMicroElec() const;

  void AddDNA(const G4String& region, const G4String& type);
  const std::vector<G4String>& RegionsDNA() const;
  const std::vector<G4String>& TypesDNA() const;

  void AddMsc(const G4String& region, const G4String& type);
  const std::vector<G4String>& RegionsMsc() const;
  const std::vector<G4String>& TypesMsc() const;

  void AddPhysics(const G4String& region, const G4String& type);
  const std::vector<G4String>& RegionsPhysics() const;
  const std::vector<G4String>& TypesPhysics() const;

  void SetSubCutoff(G4bool val, const G4String& region = "");

  void SetDeexActiveRegion(const G4String& region, G4bool fdeex,
			   G4bool fauger, G4bool fpixe);

  void SetProcessBiasingFactor(const G4String& procname, 
                               G4double val, G4bool wflag);

  void ActivateForcedInteraction(const G4String& procname, 
                                 const G4String& region,
                                 G4double length, 
                                 G4bool wflag);

  void ActivateSecondaryBiasing(const G4String& name,
				const G4String& region, 
				G4double factor,
				G4double energyLimit);

  // initialisation methods
  void DefineRegParamForLoss(G4VEnergyLossProcess*, 
                             G4bool isElectron) const;
  void DefineRegParamForEM(G4VEmProcess*) const;
  void DefineRegParamForDeex(G4VAtomDeexcitation*) const;

  G4EmParameters(G4EmParameters &) = delete;
  G4EmParameters & operator=(const G4EmParameters &right) = delete;  


private:

  G4EmParameters();

  void Initialise();

  G4bool IsLocked() const;

  G4String CheckRegion(const G4String&) const;

  void PrintWarning(G4ExceptionDescription& ed) const;
```

<!-- G4EmParameters.md ends here -->
