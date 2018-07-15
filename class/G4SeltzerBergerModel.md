<!-- G4SeltzerBergerModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:18:07 2018 (+0800)
;; Last-Updated: 日 7月 15 08:23:03 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4SeltzerBergerModel

**public G4eBremsstrahlungRelModel**

```
Implementation of the bremssrahlung energy spectrum using
1. S.M. Seltzer and M.J. Berger Nucl. Instr. Meth. B12 (1985) 95
2. S.M. Seltzer and M.J. Berger Atomic data and Nuclear Data Tables 35 (1986) 345
Cross section computation in the base class G4eBremsstrahlungRelModel
```

- "/brem_SB/br"

## class

```cpp
public:

  explicit G4SeltzerBergerModel(const G4ParticleDefinition* p = nullptr, 
				const G4String& nam = "eBremSB");

  virtual ~G4SeltzerBergerModel();

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&) override;

  virtual void InitialiseForElement(const G4ParticleDefinition*, G4int Z) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double cutEnergy,
				 G4double maxEnergy) override;

  inline void SetBicubicInterpolationFlag(G4bool);

protected:

  virtual G4double ComputeDXSectionPerAtom(G4double gammaEnergy) override;

  virtual G4String DirectoryPath() const;

private:

  void ReadData(G4int Z, const char* path = 0);

  // hide assignment operator
  G4SeltzerBergerModel & operator=(const  G4SeltzerBergerModel &right) = delete;
  G4SeltzerBergerModel(const  G4SeltzerBergerModel&) = delete;
```

<!-- G4SeltzerBergerModel.md ends here -->
