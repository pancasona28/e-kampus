<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewAssignmentNotification extends Notification {
    use Queueable;
    protected  $assignment;
    /**
     * Create a new notification instance.
     */
    public function __construct($assignment) {
        $this->assignment = $assignment;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage {
        return (new MailMessage)
            ->subject('Tugas Baru: ' . $this->assignment->title)
            ->greeting('Halo, ' . $notifiable->name . '!')
            ->line('Dosen Anda baru saja mengunggah tugas baru untuk mata kuliah: ' . $this->assignment->course->name)
            ->line('Judul Tugas: ' . $this->assignment->title)
            ->line('Deadline: ' . \Carbon\Carbon::parse($this->assignment->deadline)->format('d M Y H:i'))
            ->action('Lihat Tugas', url('/dashboard'))
            ->line('Segera kerjakan sebelum batas waktu berakhir!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array {
        return [
            //
        ];
    }
}
