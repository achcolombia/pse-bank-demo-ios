# Aplicación de demostración para bancos. PSE móvil embebido.

## Introducción
PSE Móvil permite a los clientes que utilizan dispositivos móviles autorizar pagos desde una APP en lugar de usar el navegador Web. Esto permite mayor control, recordar credenciales de forma segura y una experiencia nativa.

PSE Móvil puede ser embebido directamente en las aplicaciones de los bancos y con esto aumentar el valor de uso de la APP del banco.

Este repositorio es un ejemplo y documentación del proceso para integrar la tecnología Browser2App (usada en PSE Móvil) en la APP del banco.

El proceso de autorización del pago consta de dos partes, la primera ocurre en el registro PSE, donde se pide al usuario que utilice un correo electrónico enrrolado o que enrrole uno y la segunda parte ocurre en el banco autorizador.

El banco que quiera implementar PSE embebido en su APP puede optar entre que la biblioteca implemente el proceso completo de autorización (registro y banco) o solo el registro, entregando posteriormente el control a la APP para completar la autorización.

# Manual de uso la biblioteca nativa Browser2app en iOS 

Esta aplicación ha sido creada para demostrar la utilización de nuestra biblioteca khenshin.
Para poder ejecutar esta aplicación es necesario que tengas acceso a nuestro repositorio privado: https://dev.khipu.com/nexus/content/repositories/browser2app

Los pasos necesarios para utilizar la biblioteca nativa iOS para Browser2app son:

1. Configurar Cocoapod
2. Configurar Khenshin
3. Invocar browser2app desde una página web
6. Definir acciones de éxito y fracaso


## Cocoapod
Para instalar khenshin en tu proyecto es necesario utilizar [cocoapods](https://guides.cocoapods.org/using/getting-started.html).
> **Archivo Podfile**  
> pod 'khenshin', :git => 'https://bitbucket.org/khipu/khenshin-pod.git', :tag => '1.50'

*Importante*: Cocoapods debe estar configurado con la opción **use_frameworks!**


## Configuración de Khenshin

Antes de utilizar la biblioteca para realizar pagos, debes realizar la configuración de Khenshin en  `startEngineWithAutomatonRequestId`, en el archivo `AppDelegate.m`.

* **NavigationBarCenteredLogo**: imagen que se ubica al centro de la barra de navegación durante la inicialización.  
* **NavigationBarLeftSideLogo**: imagen que se ubica a la izquierda de la barra de navegación en caso que se habilite **"Mira Como Funciona"**.  
* **AutomatonAPIURL**: dirección URL para descargar los autómatas(*).
* **CerebroAPIURL**: dirección URL para informar de progreso de pago(*).
* **processHeader**: Si has diseñado tu propio encabezado para el proceso de pago, éste es el parámetro para entregar una vista que implemente el protocolo *ProcessHeader*.
* **processFailure**: Si has diseñado tu propia vista de fallo, éste es el parámetro para entregar un controlador que implemente el protocolo *ProcessExit*.
* **processSuccess**: Si has diseñado tu propia vista de éxito, éste es el parámetro para entregar un controlador que implemente el protocolo *ProcessExit*.
* **processWarning**: Si has diseñado tu propia vista de advertencia, éste es el parámetro para entregar un controlador que implemente el protocolo *ProcessExit*.
* **allowCredentialsSaving**: permites guardar credenciales. Por omisión es falso.
* **mainButtonStyle**: tipo de botón "Continuar". Las opciones se encuentran en "KhenshinEnums.h". Por omisión el botón va en la barra de navegación.
* **hideWebAddressInformationInForm**: permite esconder el UITextField que muestra información de la dirección web en que se encuentra el usuario. Por omisión se muestra esta información.
* **useBarCenteredLogoInForm**: En caso que se esconda la información de dirección puedes utilizar el logo *NavigationBarCenteredLogo* como relleno.
* **principalColor**: Para pintar la barra de navegación y el botón principal.
* **darkerPrincipalColor**: Para pintar el color secundario del botón principal.
* **secondaryColor**: asigna el TintColor de UIButton.
* **navigationBarTextTint**: asigna el TintColor de UINavigationBar.
* **font**: Si deseas asignar una fuente a khenshin.

**En esta versión, si no quieres utilizar imágenes puedes asignar una imagen vacía con:**

> [[UIImage alloc] init]

(\*) Éstos datos serán entregados por tu *ejecutivo* ***Browser2app***
	
## Ejemplo de Configuración
**Detalle se encuentra en AppDelegate.m**

    [KhenshinInterface initWithNavigationBarCenteredLogo:[UIImage imageNamed:@"Bar Logo"]
                               NavigationBarLeftSideLogo:[[UIImage alloc] init]
                                         automatonAPIURL:automatonAPIURL
                                           cerebroAPIURL:cerebroAPIURL
                                           processHeader:(UIView<ProcessHeader>*)[self processHeader]
                                          processFailure:(UIViewController<ProcessExit>*)[self failureViewController]
                                          processSuccess:(UIViewController<ProcessExit>*)[self successViewController]
                                          processWarning:(UIViewController<ProcessExit>*)[self warningViewController]
                                  allowCredentialsSaving:NO
                                         mainButtonStyle:KHMainButtonFatOnForm
                         hideWebAddressInformationInForm:NO
                                useBarCenteredLogoInForm:NO
                                          principalColor:[self principalColor]
                                    darkerPrincipalColor:[self darkerPrincipalColor]
                                          secondaryColor:[self secondaryColor]
                                   navigationBarTextTint:[self navigationBarTextTint]
                                                    font:nil];
    
    [KhenshinInterface setPreferredStatusBarStyle:UIStatusBarStyleLightContent]; 


## Invocación

Esta aplicación responde a URLs del tipo `demobankb2a://automatonRequestId/<ID>`. El ID es el identificador del requerimiento de autómata.

## Respuesta

Al iniciar khenshin, buscando `startEngineWithAutomatonRequestId` en `AppDelegate.m`, defines qué hacer en caso de Éxito o Fracaso utilizando los bloques:  

* **Success**: proceso a ejecutar cuando termina exitosamente el proceso de pago.  
* **Failure**: proceso a ejecutar cuando termina con fallas el proceso de pago.



