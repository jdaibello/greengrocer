import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                          label: 'E-mail',
                          icon: Icons.email,
                          inputType: TextInputType.emailAddress,
                        ),
                        const CustomTextField(
                          label: 'Senha',
                          icon: Icons.lock,
                          isSecret: true,
                        ),
                        const CustomTextField(
                          label: 'Nome',
                          icon: Icons.person,
                          inputType: TextInputType.name,
                        ),
                        CustomTextField(
                          label: 'Celular',
                          icon: Icons.phone,
                          inputType: TextInputType.number,
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomTextField(
                          label: 'CPF',
                          icon: Icons.file_copy,
                          inputType: TextInputType.number,
                          inputFormatters: [cpfFormatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
