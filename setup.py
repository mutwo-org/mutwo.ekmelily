import setuptools  # type: ignore

MAJOR, MINOR, PATCH = 0, 6, 2
VERSION = f"{MAJOR}.{MINOR}.{PATCH}"
"""This project uses semantic versioning.  See https://semver.org/ Before MAJOR = 1, there is no promise for
backwards compatibility between minor versions.
"""

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

extras_require = {"testing": ["nose", "coveralls"]}

setuptools.setup(
    name="mutwo.ekmelily",
    version=VERSION,
    license="GPL",
    description="ekmelily extension for event based framework for generative art",
    long_description=long_description,
    long_description_content_type="text/markdown",
    author="Levin Eric Zimmermann",
    author_email="levin.eric.zimmermann@posteo.eu",
    url="https://github.com/mutwo-org/mutwo.ekmelily",
    project_urls={"Documentation": "https://mutwo.readthedocs.io/en/latest/"},
    packages=[
        package
        for package in setuptools.find_namespace_packages(include=["mutwo.*"])
        if package[:5] != "tests"
    ],
    setup_requires=[],
    install_requires=[
        "mutwo.core>=0.61.2, <1.00.0",
        "mutwo.music>=0.17.0, <1.0.0",
    ],
    extras_require=extras_require,
    python_requires=">=3.9, <4",
)
