{ lib, pythonPackages, fetchPypi }:

pythonPackages.buildPythonPackage rec {
  pname = "arclight";
  version = "0.16";
  pyproject = true;
  build-system = [ pythonPackages.setuptools ];

  src = fetchPypi {
    inherit pname version;
    hash = "";  # Get this from PyPI
  };

  # Optional: add dependencies
  propagatedBuildInputs = [
    # other python packages
  ];

  # Optional: disable tests
  doCheck = false;

  meta = with lib; {
    description = "Nwscript language server";
    homepage = "https://pypi.org/project/${pname}/";
  };
}
