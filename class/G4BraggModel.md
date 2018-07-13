<!-- G4BraggModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 23:22:41 2018 (+0800)
;; Last-Updated: 六 7月 14 02:48:21 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 6
;; URL: http://wuhongyi.cn -->

# G4BraggModel

**public G4VEmModel**

Implementation of energy loss and delta-electron production by heavy slow charged particles using ICRU'49 and NIST evaluated data for protons

DEDX 数据参数在程序中  
- PSTAR;             // PSTAR G4PSTARStopping   GetElectronicDEDX
- Molecula;          // the molecula's table
	- The data and the fit from: 
	- ICRU Report N49, 1993. Ziegler's model for protons.
	- Proton kinetic energy for parametrisation (keV/amu)  
- numberOfElements==1 // Pure material ICRU49 paralmeterisation
	- The data and the fit from: 
	- ICRU Report 49, 1993. Ziegler's type of parametrisations.
	- Proton kinetic energy for parametrisation (keV/amu)  
- expStopPower125;    // Experimental Stopping power at 125keV
	- C_{x}H_{y}
	- The list of molecules from
	- J.F.Ziegler and J.M.Manoyan, The stopping of ions in compaunds,
	- Nucl. Inst. & Meth. in Phys. Res. B35 (1988) 215-228.
- Brugg's rule calculation


**ICRU Report 49, z < 92**


## class

```cpp
public:

  explicit G4BraggModel(const G4ParticleDefinition* p = nullptr,
			const G4String& nam = "Bragg");

  virtual ~G4BraggModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual G4double ComputeCrossSectionPerElectron(
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double cutEnergy,
				 G4double maxEnergy);
				 
  virtual G4double ComputeCrossSectionPerAtom(
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double Z, G4double A,
				 G4double cutEnergy,
				 G4double maxEnergy) override;
				 				 
  virtual G4double CrossSectionPerVolume(const G4Material*,
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double cutEnergy,
				 G4double maxEnergy) override;
				 
  virtual G4double ComputeDEDXPerVolume(const G4Material*,
				const G4ParticleDefinition*,
				G4double kineticEnergy,
				G4double cutEnergy) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

  // Compute ion charge 
  virtual G4double GetChargeSquareRatio(const G4ParticleDefinition*,
					const G4Material*,
					G4double kineticEnergy) override;

  virtual G4double GetParticleCharge(const G4ParticleDefinition* p,
				     const G4Material* mat,
				     G4double kineticEnergy) override;

protected:

  virtual G4double MaxSecondaryEnergy(const G4ParticleDefinition*,
				      G4double kinEnergy) final;

  inline G4double GetChargeSquareRatio() const;

  inline void SetChargeSquareRatio(G4double val);

private:

  inline void SetParticle(const G4ParticleDefinition* p);

  G4bool HasMaterial(const G4Material* material);

  G4double StoppingPower(const G4Material* material,
                               G4double kineticEnergy);

  G4double ElectronicStoppingPower(G4double z,
                                   G4double kineticEnergy) const;

  G4double DEDX(const G4Material* material, G4double kineticEnergy);

  G4bool MolecIsInZiegler1988(const G4Material* material);

  G4double ChemicalFactor(G4double kineticEnergy, G4double eloss125) const;

  // hide assignment operator
  G4BraggModel & operator=(const  G4BraggModel &right) = delete;
  G4BraggModel(const  G4BraggModel&) = delete;
```

<!-- G4BraggModel.md ends here -->
