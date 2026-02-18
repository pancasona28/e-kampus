<?php

namespace App\Filament\Pages\Auth;

use Filament\Forms\Components\TextInput;
use Filament\Pages\Auth\Register as BaseRegister;

class Register extends BaseRegister {
	protected function getForms(): array {
		return [
			'form' => $this->form(
				$this->makeForm()
					->schema([
						$this->getNameFormComponent(),
						$this->getEmailFormComponent(),

						// Tambahkan field baru sesuai model kamu
						TextInput::make('nik')
							->label('NIK')
							->required()
							->unique('users', 'nik'),,

						$this->getPasswordFormComponent(),
						$this->getPasswordConfirmationFormComponent(),
					])
					->statePath('data'),
			),
		];
	}
}
