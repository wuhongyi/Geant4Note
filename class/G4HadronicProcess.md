<!-- G4HadronicProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 06:43:08 2018 (+0800)
;; Last-Updated: 五 8月 10 06:49:44 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4HadronicProcess

**public G4VDiscreteProcess**

This is the top level Hadronic Process class

The inelastic, elastic, capture, and fission processes should derive from this class

## class

```cpp
public:
  G4HadronicProcess(const G4String& processName="Hadronic",
		    G4ProcessType procType=fHadronic);    

  // Preferred signature for subclasses, specifying their subtype here
  G4HadronicProcess(const G4String& processName, 
		    G4HadronicProcessType subType);    

  virtual ~G4HadronicProcess();

  // register generator of secondaries
  void RegisterMe(G4HadronicInteraction* a);

  // get cross section per element
  G4double GetElementCrossSection(const G4DynamicParticle * part, 
				  const G4Element * elm, 
				  const G4Material* mat = nullptr);

  // obsolete method to get cross section per element
  inline
  G4double GetMicroscopicCrossSection(const G4DynamicParticle * part, 
				      const G4Element * elm, 
				      const G4Material* mat = nullptr)
  { return GetElementCrossSection(part, elm, mat); }

  // generic PostStepDoIt recommended for all derived classes
  virtual G4VParticleChange* PostStepDoIt(const G4Track& aTrack, 
					  const G4Step& aStep);

  // initialisation of physics tables and G4HadronicProcessStore
  virtual void PreparePhysicsTable(const G4ParticleDefinition&);

  // build physics tables and print out the configuration of the process
  virtual void BuildPhysicsTable(const G4ParticleDefinition&);

  // dump physics tables 
  inline void DumpPhysicsTable(const G4ParticleDefinition& p)
  { theCrossSectionDataStore->DumpPhysicsTable(p); }

  // add cross section data set
  inline void AddDataSet(G4VCrossSectionDataSet * aDataSet)
  { theCrossSectionDataStore->AddDataSet(aDataSet);}

  // access to the list of hadronic interactions
  std::vector<G4HadronicInteraction*>& GetHadronicInteractionList()
  { return theEnergyRangeManager.GetHadronicInteractionList(); }
          
  // get inverse cross section per volume
  G4double GetMeanFreePath(const G4Track &aTrack, G4double, 
			   G4ForceCondition *);

  // access to the target nucleus
  inline const G4Nucleus* GetTargetNucleus() const
  { return &targetNucleus; }
  
  //  G4ParticleDefinition* GetTargetDefinition();
  inline const G4Isotope* GetTargetIsotope()
  { return targetNucleus.GetIsotope(); }
  
  virtual void ProcessDescription(std::ostream& outFile) const;
 
protected:    

  // generic method to choose secondary generator 
  // recommended for all derived classes
  inline G4HadronicInteraction* ChooseHadronicInteraction(
      const G4HadProjectile & aHadProjectile, G4Nucleus & aTargetNucleus,
      G4Material* aMaterial, G4Element* anElement)
  { return theEnergyRangeManager.GetHadronicInteraction(aHadProjectile, 
                                                        aTargetNucleus,
							aMaterial,anElement);
  }

  // access to the target nucleus
  inline G4Nucleus* GetTargetNucleusPointer() 
  { return &targetNucleus; }
  
public:

  void BiasCrossSectionByFactor(G4double aScale);

  // Integral option 
  inline void SetIntegral(G4bool val)
  { useIntegralXS = val; }

  // Energy-momentum non-conservation limits and reporting
  inline void SetEpReportLevel(G4int level)
  { epReportLevel = level; }

  inline void SetEnergyMomentumCheckLevels(G4double relativeLevel, G4double absoluteLevel)
  { epCheckLevels.first = relativeLevel;
    epCheckLevels.second = absoluteLevel;
    levelsSetByProcess = true;
  }

  inline std::pair<G4double, G4double> GetEnergyMomentumCheckLevels() const
  { return epCheckLevels; }

  // access to the cross section data store
  inline G4CrossSectionDataStore* GetCrossSectionDataStore()
    {return theCrossSectionDataStore;}

  inline void MultiplyCrossSectionBy(G4double factor)
  { aScaleFactor = factor; }

protected:

  void DumpState(const G4Track&, const G4String&, G4ExceptionDescription&);
            
  // access to the chosen generator
  inline G4HadronicInteraction* GetHadronicInteraction() const
  { return theInteraction; }
    
  // access to the cross section data set
  inline G4double GetLastCrossSection() 
  { return theLastCrossSection; }

  // fill result
  void FillResult(G4HadFinalState* aR, const G4Track& aT);

  // Check the result for catastrophic energy non-conservation
  G4HadFinalState* CheckResult(const G4HadProjectile& thePro,
			       const G4Nucleus& targetNucleus, 
			       G4HadFinalState* result);

  // Check 4-momentum balance
  void CheckEnergyMomentumConservation(const G4Track&, const G4Nucleus&);

private:

  void InitialiseLocal();

  G4double XBiasSurvivalProbability();
  G4double XBiasSecondaryWeight();

  // hide assignment operator as private 
  G4HadronicProcess& operator=(const G4HadronicProcess& right) = delete;
  G4HadronicProcess(const G4HadronicProcess&) = delete;

  // Set E/p conservation check levels from environment variables
  void GetEnergyMomentumCheckEnvvars();

protected:

  G4HadProjectile thePro;

  G4ParticleChange* theTotalResult; 

  G4int epReportLevel;

private:
    
  G4EnergyRangeManager theEnergyRangeManager;
    
  G4HadronicInteraction* theInteraction;

  G4CrossSectionDataStore* theCrossSectionDataStore;

  G4HadronicProcessStore* theProcessStore;
     
  G4Nucleus targetNucleus;

  bool G4HadronicProcess_debug_flag;

  bool useIntegralXS;

  G4int nMatWarn;

  G4int nICelectrons;

  G4int idxIC;

  // Energy-momentum checking
  std::pair<G4double, G4double> epCheckLevels;
  G4bool levelsSetByProcess;

  std::vector<G4VLeadingParticleBiasing *> theBias;
  
  G4double theInitialNumberOfInteractionLength;   

  G4double aScaleFactor;
  G4bool   xBiasOn;
  G4double theLastCrossSection;
```

<!-- G4HadronicProcess.md ends here -->
