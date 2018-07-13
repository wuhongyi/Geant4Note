<!-- G4EmCalculator.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 09:17:04 2018 (+0800)
;; Last-Updated: 六 7月 14 02:51:35 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 4
;; URL: http://wuhongyi.cn -->

# G4EmCalculator

Provide access to dE/dx and cross sections



G4EmCalculator is a class which provides access to cross sections and stopping powers.   
This class can be used anywhere in the user code provided the physics list has already been initialised (G4State_Idle).   
G4EmCalculator has “Get” methods which can be applied to materials for which physics tables are already built, and “Compute” methods which can be applied to any material defined in the application or existing in the Geant4 internal database. 

The public methods of this class are:
- GetDEDX(kinEnergy,particle,material,G4Region region=0)
- GetRangeFromRestrictedDEDX(kinEnergy,particle,material,G4Region* region=0)
- GetCSDARange(kinEnergy,particle,material,G4Region* region=0)
- GetRange(kinEnergy,particle,material,G4Region* region=0)
- GetKinEnergy(range,particle,material,G4Region* region=0)
- GetCrossSectionPerVolume(kinEnergy,particle,material,G4Region* region=0)
- GetShellIonisationCrossSectionPerAtom(particle,Z,shell,kinEnergy)
- GetMeanFreePath(kinEnergy,particle,material,G4Region* region=0)
- PrintDEDXTable(particle)
- PrintRangeTable(particle)
- PrintInverseRangeTable(particle)
- ComputeDEDX(kinEnergy,particle,process,material,cut=DBL_MAX)
- ComputeElectronicDEDX(kinEnergy,particle,material,cut=DBL_MAX)
- ComputeNuclearDEDX(kinEnergy,particle,material,cut=DBL_MAX)
- ComputeTotalDEDX(kinEnergy,particle,material,cut=DBL_MAX)
- ComputeCrossSectionPerVolume(kinEnergy,particle,process,material,cut=0)
- ComputeCrossSectionPerAtom(kinEnergy,particle,process,Z,A,cut=0)
- ComputeGammaAttenuationLength(kinEnergy,material)
- ComputeShellIonisationCrossSectionPerAtom(particle,Z,shell,kinEnergy)
- ComputeMeanFreePath(kinEnergy,particle,process,material,cut=0)
- ComputeEnergyCutFromRangeCut(range,particle,material)
- FindParticle(const G4String&)
- FindIon(G4int Z, G4int A)
- FindMaterial(const G4String&)
- FindRegion(const G4String&)
- FindCouple(const G4Material*, const G4Region* region=0)
- SetVerbose(G4int)



## class

```cpp
public:

  G4EmCalculator();

  ~G4EmCalculator();

  //===========================================================================
  // Methods to access precalculated dE/dx and cross sections
  // Materials should exist in the list of the G4MaterialCutsCouple
  //===========================================================================

  G4double GetDEDX(G4double kinEnergy, const G4ParticleDefinition*, 
		   const G4Material*,
                   const G4Region* r = nullptr);
  inline G4double GetDEDX(G4double kinEnergy, const G4String& part, 
		   const G4String& mat,
                   const G4String& s = "world");

  G4double GetRangeFromRestricteDEDX(G4double kinEnergy, 
				     const G4ParticleDefinition*, 
				     const G4Material*,
				     const G4Region* r = nullptr);
  inline G4double GetRangeFromRestricteDEDX(G4double kinEnergy, 
					    const G4String& part, 
					    const G4String& mat,
					    const G4String& s = "world");

  G4double GetCSDARange(G4double kinEnergy, const G4ParticleDefinition*, 
			const G4Material*,
			const G4Region* r = nullptr);
  inline G4double GetCSDARange(G4double kinEnergy, const G4String& part, 
			const G4String& mat,
			const G4String& s = "world");

  G4double GetRange(G4double kinEnergy, const G4ParticleDefinition*, 
			const G4Material*,
			const G4Region* r = nullptr);
  inline G4double GetRange(G4double kinEnergy, const G4String& part, 
			const G4String& mat,
			const G4String& s = "world");

  G4double GetKinEnergy(G4double range, const G4ParticleDefinition*, 
			const G4Material*,
			const G4Region* r = nullptr);
  inline G4double GetKinEnergy(G4double range, const G4String& part, 
			const G4String& mat,
			const G4String& s = "world");

  G4double GetCrossSectionPerVolume(
                   G4double kinEnergy, const G4ParticleDefinition*,
                   const G4String& processName,  const G4Material*,
		   const G4Region* r = nullptr);
  inline G4double GetCrossSectionPerVolume(
                   G4double kinEnergy, const G4String& part, const G4String& proc,
                   const G4String& mat, const G4String& s = "world");

  G4double GetShellIonisationCrossSectionPerAtom(
                   const G4String& part, G4int Z, 
		   G4AtomicShellEnumerator shell,
                   G4double kinEnergy);

  G4double GetMeanFreePath(G4double kinEnergy, const G4ParticleDefinition*,
			   const G4String& processName,  const G4Material*,
			   const G4Region* r = nullptr);
  inline G4double GetMeanFreePath(G4double kinEnergy, const G4String& part, 
				  const G4String& proc, const G4String& mat, 
				  const G4String& s = "world");

  void PrintDEDXTable(const G4ParticleDefinition*);

  void PrintRangeTable(const G4ParticleDefinition*);

  void PrintInverseRangeTable(const G4ParticleDefinition*);

  //===========================================================================
  // Methods to calculate dE/dx and cross sections "on fly"
  // Existing tables and G4MaterialCutsCouples are not used
  //===========================================================================

  G4double ComputeDEDX(G4double kinEnergy, const G4ParticleDefinition*,
                       const G4String& processName,  const G4Material*,
		       G4double cut = DBL_MAX);
  inline G4double ComputeDEDX(G4double kinEnergy, const G4String& part, 
		       const G4String& proc,
                       const G4String& mat, G4double cut = DBL_MAX);

  G4double ComputeElectronicDEDX(G4double kinEnergy, 
				 const G4ParticleDefinition*,
				 const G4Material* mat, G4double cut = DBL_MAX);
  inline G4double ComputeElectronicDEDX(G4double kinEnergy, const G4String& part,
				 const G4String& mat, G4double cut = DBL_MAX);

  G4double ComputeDEDXForCutInRange(G4double kinEnergy, 
				    const G4ParticleDefinition*,
				    const G4Material* mat, G4double rangecut = DBL_MAX);
  inline G4double ComputeDEDXForCutInRange(G4double kinEnergy, const G4String& part,
					   const G4String& mat, 
					   G4double rangecut = DBL_MAX);

  G4double ComputeNuclearDEDX(G4double kinEnergy, const G4ParticleDefinition*, 
			      const G4Material*);
  inline G4double ComputeNuclearDEDX(G4double kinEnergy, const G4String& part, 
			      const G4String& mat);

  G4double ComputeTotalDEDX(G4double kinEnergy, const G4ParticleDefinition*, 
			    const G4Material*, G4double cut = DBL_MAX);
  inline G4double ComputeTotalDEDX(G4double kinEnergy, const G4String& part, 
			    const G4String& mat, G4double cut = DBL_MAX);

  G4double ComputeCrossSectionPerVolume(
                       G4double kinEnergy, const G4ParticleDefinition*,
                       const G4String& processName,  const G4Material*,
		       G4double cut = 0.0);
  inline G4double ComputeCrossSectionPerVolume(
                       G4double kinEnergy, const G4String& part, 
		       const G4String& proc,
                       const G4String& mat, G4double cut = 0.0);

  G4double ComputeCrossSectionPerAtom(
                       G4double kinEnergy, const G4ParticleDefinition*,
                       const G4String& processName, G4double Z, G4double A,
		       G4double cut = 0.0);
  inline G4double ComputeCrossSectionPerAtom(
                       G4double kinEnergy, const G4String& part,
                       const G4String& processName, const G4Element*,
		       G4double cut = 0.0);

  G4double ComputeCrossSectionPerShell(
                       G4double kinEnergy, const G4ParticleDefinition*,
                       const G4String& processName, G4int Z, G4int shellIdx,
		       G4double cut = 0.0);
  inline G4double ComputeCrossSectionPerShell(
                       G4double kinEnergy, const G4String& part,
                       const G4String& processName, const G4Element*,
                       G4int shellIdx,
		       G4double cut = 0.0);

  G4double ComputeGammaAttenuationLength(G4double kinEnergy, 
					 const G4Material*);

  G4double ComputeShellIonisationCrossSectionPerAtom(
                   const G4String& part, G4int Z, 
		   G4AtomicShellEnumerator shell,
                   G4double kinEnergy,
                   const G4Material* mat = nullptr);

  G4double ComputeMeanFreePath(
                       G4double kinEnergy, const G4ParticleDefinition*,
                       const G4String& processName,  const G4Material*,
		       G4double cut = 0.0);
  inline G4double ComputeMeanFreePath(
                       G4double kinEnergy, const G4String&, const G4String&,
                       const G4String& processName, G4double cut = 0.0);

  G4double ComputeEnergyCutFromRangeCut(
                       G4double range, const G4ParticleDefinition*,
		       const G4Material*);
  inline G4double ComputeEnergyCutFromRangeCut(
                       G4double range, const G4String&,
		       const G4String&);

  //===========================================================================
  // Methods to access particles, materials, regions, processes
  //===========================================================================

  const G4ParticleDefinition* FindParticle(const G4String&);

  const G4ParticleDefinition* FindIon(G4int Z, G4int A);

  const G4Material* FindMaterial(const G4String&);

  const G4Region* FindRegion(const G4String&);

  const G4MaterialCutsCouple* FindCouple(const G4Material*, 
					 const G4Region* r = nullptr);

  G4VProcess* FindProcess(const G4ParticleDefinition* part,
			  const G4String& processName);

  void SetupMaterial(const G4Material*);

  void SetupMaterial(const G4String&);

  void SetVerbose(G4int val);

  //===========================================================================
  // Private methods 
  //===========================================================================

private:

  G4bool UpdateParticle(const G4ParticleDefinition*, G4double kinEnergy);

  G4bool UpdateCouple(const G4Material*, G4double cut);

  void FindLambdaTable(const G4ParticleDefinition*, 
		       const G4String& processName,
		       G4double kinEnergy);

  G4bool FindEmModel(const G4ParticleDefinition*, 
                     const G4String& processName,
                           G4double kinEnergy);

  G4VEnergyLossProcess* FindEnergyLossProcess(const G4ParticleDefinition*);

  G4VEnergyLossProcess* FindEnLossProcess(const G4ParticleDefinition*,
					  const G4String& processName);

  G4VEmProcess* FindDiscreteProcess(const G4ParticleDefinition*,
				    const G4String& processName);

  G4VMultipleScattering* FindMscProcess(const G4ParticleDefinition*,
					const G4String& processName);

  G4bool ActiveForParticle(const G4ParticleDefinition* part,
			   G4VProcess* proc);

  void CheckMaterial(G4int Z);

  // hide copy and assign
  G4EmCalculator & operator=(const  G4EmCalculator &right) = delete;
  G4EmCalculator(const  G4EmCalculator&) = delete;
```


<!-- G4EmCalculator.md ends here -->
