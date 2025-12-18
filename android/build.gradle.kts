allprojects {
//    ext.kotlin_version = '1.7.10' // 版本号可能不同，不用改
    repositories {
        // --- 开始添加阿里云镜像 ---
//        maven { url 'https://maven.aliyun.com/repository/google' }
//        maven { url 'https://maven.aliyun.com/repository/jcenter' }
//        maven { url 'https://maven.aliyun.com/repository/public' }
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
