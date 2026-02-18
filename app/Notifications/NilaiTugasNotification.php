<?php

namespace App\Notifications;

use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class NilaiTugasNotification extends Notification {
    protected $assignmentTitle;
    protected $score;

    public function __construct($assignmentTitle, $score) {
        $this->assignmentTitle = $assignmentTitle;
        $this->score = $score;
    }

    public function via($notifiable): array {
        return ['mail']; // Hanya kirim via email
    }

    public function toMail($notifiable): MailMessage {
        return (new MailMessage)
            ->subject('Notifikasi Nilai Tugas: ' . $this->assignmentTitle)
            ->greeting('Halo, ' . $notifiable->name)
            ->line('Dosen telah memberikan nilai untuk tugas Anda.')
            ->line('Tugas: ' . $this->assignmentTitle)
            ->line('Nilai Anda: ' . $this->score)
            ->action('Lihat Detail di e-Kampus', url('/admin'))
            ->line('Terima kasih telah menggunakan layanan e-Kampus!');
    }
}
