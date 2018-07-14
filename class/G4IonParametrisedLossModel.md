<!-- G4IonParametrisedLossModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 05:38:32 2018 (+0800)
;; Last-Updated: 六 7月 14 07:57:44 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4IonParametrisedLossModel

**public G4VEmModel**

Model for computing the energy loss of ions by employing a parameterisation of dE/dx tables (default ICRU 73 tables). For ion-material combinations and/or projectile energies not covered by this model, the G4BraggIonModel and G4BetheBloch models are employed.


* G4BraggIonModel
* G4BetheBlochModel
* By default ICRU 73 stopping power tables
	* G4IonStoppingData  
		* "ion_stopping_data/icru73"
	* G4IonDEDXScalingICRU73


## class

```cpp
 public:
   G4IonParametrisedLossModel(const G4ParticleDefinition* particle = 0,
                              const G4String& name = "ParamICRU73");

   virtual ~G4IonParametrisedLossModel();

   virtual void Initialise(
                           const G4ParticleDefinition*, // Projectile
                           const G4DataVector&); // Cut energies

   virtual G4double MinEnergyCut(
                                 const G4ParticleDefinition*,  // Projectile
		        	 const G4MaterialCutsCouple*);

   virtual G4double ComputeCrossSectionPerAtom(
                                 const G4ParticleDefinition*, // Projectile
				 G4double,  // Kinetic energy of projectile
				 G4double,  // Atomic number
                                 G4double,  // Mass number
				 G4double,  // Energy cut for secondary prod.
				 G4double); // Maximum energy of secondaries
				 				 
   virtual G4double CrossSectionPerVolume(
                                 const G4Material*,  // Target material
				 const G4ParticleDefinition*, // Projectile
				 G4double,  // Kinetic energy
				 G4double,  // Energy cut for secondary prod.
				 G4double); // Maximum energy of secondaries
				 
   virtual G4double ComputeDEDXPerVolume(
                                 const G4Material*, // Target material
				 const G4ParticleDefinition*, // Projectile
				 G4double,  // Kinetic energy of projectile
				 G4double); // Energy cut for secondary prod.

   // Function, which computes the continuous energy loss (due to electronic
   // stopping) for a given pre-step energy and step length by using
   // range vs energy (and energy vs range) tables  
   G4double ComputeLossForStep(
                                 const G4MaterialCutsCouple*, // Mat-cuts couple
				 const G4ParticleDefinition*, // Projectile
				 G4double,  // Kinetic energy of projectile
				 G4double); // Length of current step

   // Function, which computes the mean energy transfer rate to delta rays 
   inline G4double DeltaRayMeanEnergyTransferRate(
                                 const G4Material*, // Target Material
			         const G4ParticleDefinition*, // Projectile
				 G4double,  // Kinetic energy of projectile
				 G4double); // Energy cut for secondary prod.


   virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double,  // Energy cut for secondary prod.
                                 G4double); // Maximum energy of secondaries

   virtual G4double GetChargeSquareRatio(
                                 const G4ParticleDefinition*, // Projectile
		 	 	 const G4Material*,  // Target Material
				 G4double); // Kinetic energy of projectile

   virtual G4double GetParticleCharge(
                                 const G4ParticleDefinition*, // Projectile
				 const G4Material*,  // Target Material
				 G4double); // Kinetic energy of projectile 

   virtual void CorrectionsAlongStep(
                                 const G4MaterialCutsCouple*,// Mat.-Cut couple
				 const G4DynamicParticle*,  // Dyn. particle
				 G4double&, // Energy loss in current step
				 G4double&, 
				 G4double); // Length of current step

   // Function which allows to add additional stopping power tables
   // in combination with a scaling algorithm, which may depend on dynamic
   // information like the current particle energy (the table and scaling 
   // algorithm are used via a handler class, which performs e.g.caching or
   // which applies the scaling of energy and dE/dx values)
   G4bool AddDEDXTable(const G4String& name,
                     G4VIonDEDXTable* table, 
                     G4VIonDEDXScalingAlgorithm* algorithm = 0); 

   G4bool RemoveDEDXTable(const G4String& name); 

   // Function which allows to switch off scaling of stopping powers of heavy
   // ions from existing ICRU 73 data
   void DeactivateICRU73Scaling();

   // Function checking the applicability of physics tables to ion-material
   // combinations (Note: the energy range of tables is not checked)
   inline LossTableList::iterator IsApplicable(
                      const G4ParticleDefinition*,  // Projectile (ion) 
                      const G4Material*);           // Target material

   // Function printing a dE/dx table for a given ion-material combination
   // and a specified energy grid 
   void PrintDEDXTable(
                      const G4ParticleDefinition*,  // Projectile (ion) 
                      const G4Material*, // Absorber material
                      G4double,          // Minimum energy per nucleon
                      G4double,          // Maximum energy per nucleon
                      G4int,             // Number of bins
                      G4bool);           // Logarithmic scaling of energy

   // Function printing a dE/dx table for a given ion-material combination
   // and a specified energy grid 
   void PrintDEDXTableHandlers(
                      const G4ParticleDefinition*,  // Projectile (ion) 
                      const G4Material*, // Absorber material
                      G4double,          // Minimum energy per nucleon
                      G4double,          // Maximum energy per nucleon
                      G4int,             // Number of bins
                      G4bool);           // Logarithmic scaling of energy
   
   // Function for setting energy loss limit for stopping power integration
   inline void SetEnergyLossLimit(G4double ionEnergyLossLimit); 

 protected:

   virtual 
   G4double MaxSecondaryEnergy(const G4ParticleDefinition*,
			       G4double);   // Kinetic energy of projectile

 private:
   // Function which updates parameters concerning the dE/dx calculation
   // (the parameters are only updated if the particle, the material or 
   // the associated energy cut has changed)
   void UpdateDEDXCache(
                  const G4ParticleDefinition*,   // Projectile (ion) 
                  const G4Material*,             // Target material
                  G4double cutEnergy);           // Energy cut

   // Function which updates parameters concerning the range calculation
   // (the parameters are only updated if the particle, the material or 
   // the associated energy cut has changed)
   void UpdateRangeCache(
                  const G4ParticleDefinition*,   // Projectile (ion) 
                  const G4MaterialCutsCouple*);  // Target material

   // Function, which updates parameters concering particle properties
   inline void UpdateCache(
                  const G4ParticleDefinition*);  // Projectile (ion) 
 
   // Function, which builds range vs energy (and energy vs range) vectors
   // for a given particle, material and energy cut   
   void BuildRangeVector(
                  const G4ParticleDefinition*,   // Projectile (ion) 
                  const G4MaterialCutsCouple*);  // Material cuts couple

   // Assignment operator and copy constructor are hidden:
   G4IonParametrisedLossModel & operator=(
                              const G4IonParametrisedLossModel &right);
   G4IonParametrisedLossModel(const G4IonParametrisedLossModel &);
```


<!-- G4IonParametrisedLossModel.md ends here -->
