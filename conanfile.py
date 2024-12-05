from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMakeDeps, CMake, cmake_layout


class Pkg(ConanFile):
    settings = "os", "arch", "compiler", "build_type"
    options = {"func": ["ANY"],
               "val": ["ANY"]}

    requires = "openmpi/4.1.6"

    def layout(self):
        self.folders.build_folder_vars = ["options.val", "options.func", "settings.build_type"]
        cmake_layout(self)

    def generate(self):
        tc = CMakeToolchain(self)
        tc.user_presets_path = None
        tc.generate()
        deps = CMakeDeps(self)
        deps.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
