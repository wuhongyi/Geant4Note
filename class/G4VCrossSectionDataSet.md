<!-- G4VCrossSectionDataSet.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 03:25:14 2018 (+0800)
;; Last-Updated: 五 8月 10 03:27:04 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VCrossSectionDataSet

* This is a base class for hadronic cross section data sets.  Users may derive specialized cross section classes and register them with the appropriate process, or use provided data sets.
* Each cross section should have unique name Minimal and maximal energy for the cross section will be used in run time before IsApplicable method is called
* Both the name and the energy interval will be used for documentation 




## class

```cpp
public: //with description

  G4VCrossSectionDataSet(const G4String& nam = "");

  virtual ~G4VCrossSectionDataSet();

  //============== Is Applicable methods ===============================
  // The following three methods have default implementations returning
  // "false".  Derived classes should implement only needed methods.
 
  // Element-wise cross section
  virtual
  G4bool IsElementApplicable(const G4DynamicParticle*, G4int Z, 
			     const G4Material* mat = 0);

  // Derived classes should implement this method if they provide isotope-wise 
  // cross sections.  Default arguments G4Element and G4Material are needed to 
  // access low-energy neutron cross sections, but are not required for others.
  virtual
  G4bool IsIsoApplicable(const G4DynamicParticle*, G4int Z, G4int A,    
			 const G4Element* elm = 0,
			 const G4Material* mat = 0);

  //============== GetCrossSection methods ===============================

  // This is a generic method to access cross section per element
  // This method should not be overwritten in a derived class
  inline G4double GetCrossSection(const G4DynamicParticle*, const G4Element*,
				  const G4Material* mat = 0);

  // This is a generic method to compute cross section per element
  // If the DataSet is not applicable the method returns zero
  // This method should not be overwritten in a derived class
  G4double ComputeCrossSection(const G4DynamicParticle*, 
			       const G4Element*,
			       const G4Material* mat = 0);

  // The following two methods have default implementations which throw
  // G4HadronicException.  Derived classes should implement only needed
  // methods, which are assumed to be called at run time.

  // Implement this method for element-wise cross section 
  virtual
  G4double GetElementCrossSection(const G4DynamicParticle*, G4int Z,
				  const G4Material* mat = 0);

  // Derived classes should implement this method if they provide isotope-wise
  // cross sections.  Default arguments G4Element and G4Material are needed to
  // access low-energy neutron cross sections, but are not required for others. 
  virtual
  G4double GetIsoCrossSection(const G4DynamicParticle*, G4int Z, G4int A,  
			      const G4Isotope* iso = 0,
			      const G4Element* elm = 0,
			      const G4Material* mat = 0);

  //=====================================================================

  // Implement this method if needed
  // This method is called for element-wise cross section
  // Default implementation assumes equal cross sections for all isotopes 
  virtual G4Isotope* SelectIsotope(const G4Element*, G4double kinEnergy);

  // Implement this method if needed
  virtual
  void BuildPhysicsTable(const G4ParticleDefinition&);

  // Implement this method if needed
  // Default implementation will provide a dump of the cross section 
  // in logarithmic scale in the interval of applicability 
  virtual
  void DumpPhysicsTable(const G4ParticleDefinition&);

  virtual void CrossSectionDescription(std::ostream&) const;

public: // Without Description

  virtual G4int GetVerboseLevel() const;

  virtual void SetVerboseLevel(G4int value);

  inline G4double GetMinKinEnergy() const;

  inline void SetMinKinEnergy(G4double value);

  inline G4double GetMaxKinEnergy() const;

  inline void SetMaxKinEnergy(G4double value);

  inline const G4String& GetName() const;

protected:

  inline void SetName(const G4String&);

  G4int verboseLevel;

private:

  G4VCrossSectionDataSet & operator=(const G4VCrossSectionDataSet &right);
  G4VCrossSectionDataSet(const G4VCrossSectionDataSet&);

  G4CrossSectionDataSetRegistry* registry;

  G4double minKinEnergy;
  G4double maxKinEnergy;

  G4String name;
```

<!-- G4VCrossSectionDataSet.md ends here -->
